def _deb_extract_impl(ctx):
    deb_file = ctx.file.deb_file
    output_files = ctx.outputs.outputs

    ar_tool = "ar"
    tar_tool = "tar"
    chmod_tool = "chmod"

    cmd = """
set -ex

# Create a working directory
WORK_DIR=$(mktemp -d)
trap "rm -rf $WORK_DIR" EXIT

base_dir="${{PWD}}"
pushd "$WORK_DIR"
"{ar}" x "${{base_dir}}/{deb_file}"

# Find the data archive (data.tar.*)
DATA_ARCHIVE=$(find . -type f -name 'data.tar.*' -o -name 'data.tar')

if [ -z "$DATA_ARCHIVE" ]; then
    echo "No data archive found in the .deb package."
    exit 1
fi

# Extract the specified files from the data archive
if ! "{tar}" xf "$DATA_ARCHIVE" {file_paths}; then
  "{tar}" tf "$DATA_ARCHIVE"
  exit 1
fi
popd

# Copy the extracted files to the output directories
""".format(
        ar=ar_tool,
        deb_file=deb_file.path,
        tar=tar_tool,
        file_paths=" ".join(['"./{}"'.format(path) for path in ctx.attr.file_paths]),
    )

    for file_path, output_file in zip(ctx.attr.file_paths, output_files):
        cmd += """
mkdir -p "{output_dir}"
cp -a "{work_dir}/{file_path}" "{output_path}"
""".format(
            output_dir=output_file.dirname,
            work_dir="$WORK_DIR",
            file_path=file_path,
            output_path=output_file.path,
        )
        if ctx.attr.executable:
            cmd += """
"{chmod}" +x "{output_path}"
""".format(
                chmod=chmod_tool,
                output_path=output_file.path,
            )

    # Create the action to run the command
    ctx.actions.run_shell(
        inputs=[deb_file],
        outputs=output_files,
        command=cmd,
        progress_message="Extracting files from {}".format(deb_file.basename),
        mnemonic="DebExtract",
    )

deb_extract = rule(
    implementation=_deb_extract_impl,
    attrs={
        "deb_file": attr.label(allow_single_file=True, mandatory=True),
        "file_paths": attr.string_list(mandatory=True),
	"outputs": attr.output_list(mandatory=True),
        "executable": attr.bool(default=False),
    },
    doc="Extracts specified files from a .deb package.",
)


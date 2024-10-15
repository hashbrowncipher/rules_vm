def _extract_deb_impl(repository_ctx):
    deb_file = repository_ctx.path(repository_ctx.attr.deb[0])
    output_dir = repository_ctx.path(repository_ctx.attr.output_dir)

    # Ensure output directory exists
    repository_ctx.execute(["mkdir", "-p", output_dir])

    # Change to the output directory
    with repository_ctx.chdir(output_dir):
        # Extract the .deb file using ar
        repository_ctx.execute(["ar", "x", deb_file])

        # Find the data archive (data.tar.xz, data.tar.gz, etc.)
        data_archives = repository_ctx.os.listdir(output_dir)
        data_archive = next((f for f in data_archives if f.startswith("data.tar")), None)
        if not data_archive:
            fail("No data archive found in the .deb package.")

        # Extract the required files from the data archive
        repository_ctx.execute(["tar", "xf", data_archive] + repository_ctx.attr.files)

        # Set executable permissions on extracted binaries
        for file_to_extract in repository_ctx.attr.files:
            file_path = repository_ctx.path(output_dir, file_to_extract)
            if repository_ctx.os.path.exists(file_path):
                repository_ctx.execute(["chmod", "+x", file_path])

        # Clean up unnecessary files
        for f in ["debian-binary", "control.tar.gz", data_archive]:
            file_path = repository_ctx.path(output_dir, f)
            if repository_ctx.os.path.exists(file_path):
                repository_ctx.execute(["rm", "-f", file_path])

    # Create an empty BUILD file to make this directory a valid Bazel package
    repository_ctx.file("BUILD.bazel", contents="")

extract_deb = repository_rule(
    implementation = _extract_deb_impl,
    attrs = {
        "deb": attr.label(allow_single_file = True, mandatory = True),
        "files": attr.string_list(mandatory = True),
        "output_dir": attr.string(mandatory = True),
    },
)

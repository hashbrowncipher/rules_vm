#!/usr/bin/env python3
import fnmatch
import re
import tarfile
from io import BytesIO
from tarfile import TarInfo

from zstandard import ZstdDecompressor

from lib.filesystem import Filesystem

LOCALE_MATCHER = re.compile(fnmatch.translate("usr/share/locale/*/LC_MESSAGES/*.mo"))


@classmethod
def zstdopen(cls, name, mode="r", fileobj=None, **kwargs):
    dctx = ZstdDecompressor()
    fileobj = dctx.stream_reader(fileobj)
    try:
        t = cls.taropen(name, mode, fileobj, **kwargs)
    except:  # noqa: E722
        fileobj.close()
        raise

    t._extfileobj = False
    return t


tarfile.TarFile.zstdopen = zstdopen
tarfile.TarFile.OPEN_METH["zst"] = "zstdopen"

SECOND_STAGE = r"""#!/bin/bash
set -e

cat << EOF > /usr/bin/policy-rc.d
#!/bin/sh
exit 101
EOF
chmod 755 /usr/bin/policy-rc.d

echo "Making control file" >&2
cd /var/lib/dpkg/info
for f in *.control; do
  cat $f
  echo
done > /var/lib/dpkg/status
rm -r *.control

# SOURCE_DATE_EPOCH makes /etc/shadow reproducible
export DEBIAN_FRONTEND=noninteractive SOURCE_DATE_EPOCH=0

set -x
for script in *.preinst; do
  package_fullname="${script//.preinst}"
  package_name="${package_fullname//:*}"
  DPKG_MAINTSCRIPT_NAME=preinst \
  DPKG_MAINTSCRIPT_PACKAGE=$package_name \
  ./"$script" install
done

cd /
# libc6's postinst requires `which`, which is configured via update-alternatives(1)
dpkg --configure --force-depends debianutils
dpkg --configure -a

rm -f /etc/passwd- /etc/group- /etc/shadow- \
  /var/cache/debconf/*-old /var/lib/dpkg/*-old \
  /init /etc/machine-id
# This cache is not reproducible
rm /var/cache/ldconfig/aux-cache
# Some log files (e.g. btmp) need to exist with the right modes, so we truncate them
# instead of deleting them.
find /var/log -type f -exec truncate -s0 {} \;
"""
ADD_SOURCES_LIST = "echo deb {archive_url} {suite} main >> /etc/apt/sources.list\n"


def _get_dpkg_name(control):
    if control.get("Multi-Arch", None) == "same":
        return "{}:{}".format(control["Package"], control["Architecture"])

    return control["Package"]


WANTED_LINES = set(["Package", "Architecture", "Multi-Arch"])


def parse_control_data(data):
    lines = data.splitlines(True)
    parsed = dict()
    for idx, line in enumerate(lines):
        parts = line.split(": ", 1)
        if len(parts) != 2:
            continue

        k, v = parts
        if k in WANTED_LINES:
            parsed[k] = v.rstrip()

    # the table at lib/dpkg/parse.c seems to determine the "correct" order
    # of fields, but we just drop this last.
    # We assume that the next run of dpkg will fix it (it does)
    lines.append("Status: install ok unpacked\n")

    name = _get_dpkg_name(parsed)
    return ("var/lib/dpkg/info/{}.".format(name), "".join(lines).encode())


def get_debs_from_directory(paths):
    for deb in paths:
        yield deb.open("rb")


def extract_whole_tar(contents, mode):
    tf = tarfile.open(fileobj=BytesIO(contents), mode=mode)
    ret = dict()
    for ti in tf:
        inner_fh = tf.extractfile(ti)
        file_data = None if inner_fh is None else inner_fh.read()
        ret[ti.name] = (ti, file_data)
    return ret


def _dpkg_info_files(prefix, control_data, tf):
    control_info = TarInfo(prefix + "control")
    control_info.size = len(control_data)
    yield control_info, control_data

    for member, file_contents in tf:
        if not member.isreg():
            continue

        name = member.name.lstrip("./")
        if name == "control":
            continue
        member.name = prefix + name
        yield member, file_contents


def handle_control_tar(contents, mode):
    data = extract_whole_tar(contents, mode)
    control_data = data["./control"][1].decode()
    prefix, new_control_data = parse_control_data(control_data)
    return prefix, _dpkg_info_files(prefix, new_control_data, data.values())


def transform_name(name):
    if name == "":
        # I have no idea why dpkg does this
        return "/.\n"

    return "/" + name + "\n"


def split_tar_namemode(name: bytes):
    # b"control.tar.gz    " -> ("control", "r:gz")
    cleaned_name = name.strip().decode()
    root, rest = cleaned_name.split(".tar")
    ext = rest.lstrip(".")
    mode = f"r:{ext}"
    return root, mode


def unpack_ar(fh):
    assert fh.read(8) == b"!<arch>\n"
    prefix = None
    files = []
    while True:
        header = fh.read(60)
        if not header:
            break

        name = header[0:16]

        size = int(header[48:58], 10)
        assert header[58:60] == b"\x60\x0A"
        file_contents = fh.read(size)
        fh.read(size % 2)

        try:
            root, mode = split_tar_namemode(name)
        except ValueError:
            continue

        if root == "data":
            tf = tarfile.open(fileobj=BytesIO(file_contents), mode=mode)
            for member in tf:
                contents = tf.extractfile(member).read() if member.isreg() else None
                member.name = member.name.lstrip("./")
                files.append(transform_name(member.name))
                yield member, contents

        if root == "control":
            prefix, dpkg_files = handle_control_tar(file_contents, mode)
            yield from dpkg_files

    if prefix is None:
        raise RuntimeError("Missing control file?")

    # This becomes the dpkg .list info file
    files_manifest = "".join(files).encode()
    info = TarInfo(prefix + "list")
    info.size = len(files_manifest)
    yield info, files_manifest


def get_unpacked_files(fhs):
    for fh in fhs:
        yield from unpack_ar(fh)
        fh.close()


def create_filesystem(
    deb_names,
    add_sources_list: str,
    pre_link: dict[str, str] = None,
    third_stage: str = "",
):
    fs = Filesystem()

    second_stage = SECOND_STAGE
    for info in add_sources_list:
        second_stage += ADD_SOURCES_LIST.format(**info)

    second_stage += third_stage

    fs.file("init", second_stage, mode=0o755)

    if pre_link is None:
        # These files will get created by dpkg as well..mostly.
        # There's a risk that zero packages will install these files.
        # Which is why we create them manually
        for name in ("bin", "sbin", "lib", "lib32", "lib64", "libx32"):
            real = f"usr/{name}"
            fs.mkdir(real)
            fs.symlink(name, real)
    else:
        for name, target in pre_link.items():
            fs.mkdir(target)
            fs.symlink(name, target)

    debs = get_debs_from_directory(deb_names)
    for member, contents in get_unpacked_files(debs):
        fs.add(member, BytesIO(contents))

    return fs


def main():
    import sys
    from pathlib import Path

    outfile = Path(sys.argv[1])
    paths = [Path(p) for p in sys.argv[2:]]
    fs = create_filesystem(paths, [])
    with outfile.open("wb") as out_fh:
        fs.write(out_fh)


if __name__ == "__main__":
    raise SystemExit(main())

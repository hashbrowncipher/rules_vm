#!/usr/bin/env python3
from pathlib import Path
import sys
from lib.filesystem import Filesystem
import io


def make_initscript(packages):
    ret = io.StringIO()

    def output(*args, **kwargs):
        print(*args, file=ret, **kwargs)

    output("#!/bin/bash")
    output("set -euo pipefail")
    output(
        "filename=/mnt/dists/local/main/binary-$(dpkg --print-architecture)/Packages"
    )
    output("archive_name=/var/lib/apt/lists/${filename//\//_}")
    output('ln -s "${filename}" "${archive_name}"')
    output("apt-cache dumpavail | dpkg --merge-avail")
    output("dpkg --set-selections <<EOF")
    for package in packages:
        output(package + " install")
    output("EOF")
    output("apt-get -y dselect-upgrade")
    return ret.getvalue().encode()


def main():
    fs = Filesystem()

    argv = list(sys.argv[1:])
    argv.reverse()
    output_path = Path(argv.pop())
    package_names = []
    while (arg := argv.pop()) != "--":
        package_names.append(arg)

    packages_info = Path(argv.pop())
    fs.file("/etc/apt/sources.list", b"deb [trusted=yes] file:/mnt local main")
    fs.file("/mnt/dists/local/main/binary-amd64/Packages", packages_info.read_bytes())
    packages = argv
    fs.file("/init", make_initscript(package_names), mode=0o555)
    for package in sorted(packages):
        source_path = Path(argv.pop())
        fs.file("/mnt/" + source_path.name, source_path.read_bytes())

    with output_path.open("wb") as fh:
        fs.write(fh)


if __name__ == "__main__":
    raise SystemExit(main())

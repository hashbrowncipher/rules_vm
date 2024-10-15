import os
import re
import sys
from pathlib import Path
from dataclasses import dataclass
import string

WANTED_PACKAGES = ["apt", "gpgv", "mawk", "systemd-sysv", "linux-image-virtual", "udev"]
FILENAME_REGEXP = re.compile(b"\nFilename:.*$", re.M)

def parse_package(raw):
    ret = dict()
    raw = raw.decode()
    for line in raw.splitlines():
        if line.startswith(' '):
            # Append onto the last item
            last_field = list(ret.keys())[-1]
            ret[last_field] += '\n' + line
        elif ':' in line:
            field, value = line.split(':', 1)
            ret[field] = value.lstrip()
        else:
            raise ValueError("Unprocessable line", line) 

    return ret


@dataclass(frozen=True)
class PackageEntry:
    name: bytes
    raw: bytes

    @classmethod
    def new(cls, raw):
        try:
            name = parse_package(raw)["Package"]
        except KeyError:
            raise
        return cls(name, raw)

    @property
    def parsed(self):
        return parse_package(self.raw)

    def rewrite_filename(self, name):
        replacement = b"\nFilename: " + name.encode()
        return FILENAME_REGEXP.sub(replacement, self.raw) + b"\n"


def parse_packages_files(paths):
    ret = dict()
    for path in paths:
        entries = (PackageEntry.new(s) for s in path.read_bytes().split(b"\n\n") if s)
        for entry in entries:
            ret[entry.name] = entry

    return ret

ALLOWED_CHARACTERS = set(string.ascii_letters + string.digits + "-_.")

def rewrite_repo_rule(name):
    ret = []
    for c in name:
        if c not in ALLOWED_CHARACTERS:
            c = "~~" if c == "~" else "~" + c.encode().hex() + "."
        ret.append(c)
    return "".join(ret)

def generate_bazel_rules(packages, base_url):
    names = []
    rules = []
    for pkg in packages:
        parsed = pkg.parsed
        package_name = parsed.get('Package')
        version = parsed.get('Version')
        filename = parsed.get('Filename')
        sha256 = parsed.get('SHA256')
        size = parsed.get('Size')

        # Construct the download URL
        try:
            url = base_url + filename.lstrip('/')
        except AttributeError:
            print(parsed)
            raise

        # Extract the basename of the file
        basename = os.path.basename(filename)

        bazel_name = rewrite_repo_rule(basename.rsplit(".", 1)[0])

        # Construct the Bazel rule
        bazel_rule = f"""
    # Size: {size}
    http_file(
        name = "{bazel_name}",
        urls = ["{url}"],
        downloaded_file_path = "{basename}",
        sha256 = "{sha256}",
    )
"""
        names.append(bazel_name)
        rules.append(bazel_rule)
    return names, rules

def modify_packages(packages):
    modified_packages = []
    for pkg in packages:
        filename = pkg.parsed["Filename"]
        basename = os.path.basename(filename)
        modified_packages.append(pkg.rewrite_filename(basename))
    return modified_packages

def process_depends(line):
    if line is None:
        return []

    # lop off any dependency qualifiers
    return [x.strip().split()[0] for x in line.split(",")]

def get_dependencies(package):
    parsed = package.parsed
    ret = list()
    for key in ("Depends", "Pre-Depends"):
        ret.extend(process_depends(parsed.get(key)))
    return set(ret)

def get_needed_packages(packages_info, required):
    unprocessed = set(required)
    ret = set()

    while unprocessed:
        name = unprocessed.pop()

        try:
            info = packages_info[name]
        except KeyError:
            print(f"Missing package {name}", file=sys.stderr)
            continue

        ret.add(name)
        for dep in get_dependencies(info):
            if dep in ret:
                continue

            if dep in unprocessed:
                continue

            print("Adding dependency {} from {}".format(dep, name), file=sys.stderr)
            unprocessed.add(dep)
    return ret


def filter_packages(packages, wanted_packages):
    required = {k for k, v in packages.items() if v.parsed.get("Priority") == "required"}
    required.update(wanted_packages)
    all_wanted_packages = get_needed_packages(packages, required)
    return [v for k, v in packages.items() if k in all_wanted_packages]


def main():
    filenames = (
        'packages/noble_universe',
        'packages/noble-updates_universe',
        'packages/noble_main',
        'packages/noble-updates_main'
    )
    paths = [Path(x) for x in filenames]
    base_url = 'http://archive.ubuntu.com/ubuntu/'

    # Output filenames
    bazel_output_file = 'packages.bzl'
    packages_output_file = 'Packages_modified'

    # Parse the Packages files
    package_info = parse_packages_files(paths)
    packages = filter_packages(package_info, WANTED_PACKAGES)

    # Generate Bazel rules
    names, rules = generate_bazel_rules(packages, base_url)
    with Path("output.lock.bzl").open("w") as fh:
        fh.write('load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_file")\n\n')
        fh.write('def load_packages():')
        for rule in rules:
            fh.write(rule)

    with Path("packages-workspace.bzl").open("w") as fh:
        fh.write("def make_packages(name):\n")
        fh.write("    native.filegroup(\n")
        fh.write("        name=name,\n")
        fh.write("        srcs=[\n")
        for name in names:
            target = f"@{name}//file"
            fh.write(f"           {repr(target)},\n")
        fh.write("        ]\n")
        fh.write("    )\n")

    # Modify the Filename fields
    modified_packages = modify_packages(packages)
    with Path("output-Packages").open("wb") as fh:
        for package in modified_packages:
            fh.write(package)
            fh.write(b"\n")


if __name__ == '__main__':
    raise SystemExit(main())

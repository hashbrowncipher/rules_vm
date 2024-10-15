#!/usr/bin/env python3
import argparse
import os
import stat
import sys
from enum import Enum
from io import BytesIO
from dataclasses import dataclass
from bisect import insort
from pathlib import Path
from typing import List

import zstandard

BUSYBOX_APPLETS = ["cat", "ls", "mkdir", "mount", "pivot_root", "poweroff", "sh", "tar"]


def to_cpio_hex(num):
    return format(num, "08X").encode("ascii")


def convert_cpio(value):
    if isinstance(value, int):
        value = to_cpio_hex(value)

    return value


def cpio_pad(b):
    pad_size = (4 - (len(b) % 4)) % 4
    padding = b"\x00" * pad_size
    return b, padding


class Type(Enum):
    file = stat.S_IFREG
    directory = stat.S_IFDIR
    symlink = stat.S_IFLNK


@dataclass(frozen=True)
class Entry:
    path: str
    type: Type = Type.file
    mode: int = 0o644
    uid: int = 0
    gid: int = 0
    mtime: int = 0
    content: bytes = b""


class CPIOArchive:
    def __init__(self):
        self.entries: List[Entry] = []

    def add_entry(self, path, content=b"", **kwargs):
        entry = Entry(path=path, content=content, **kwargs)
        insort(self.entries, entry, key=lambda e: e.path)

    def generate(self):
        output = BytesIO()
        for inode, entry in enumerate(self.entries, start=1):
            output.write(self.cpio_entry(entry, inode))

        trailer_entry = Entry(path="TRAILER!!!")
        entry, padding = cpio_pad(self.cpio_entry(trailer_entry, inode=0))
        output.write(entry)
        output.write(padding)
        return output.getvalue()

    def cpio_entry(self, entry, inode):
        name_bytes = entry.path.encode("utf-8") + b"\x00"
        header_elems = [
            b"070701",  # c_magic
            inode,  # c_ino
            entry.mode | entry.type.value,  # c_mode
            entry.uid,  # c_uid
            entry.gid,  # c_gid
            1,  # c_nlink
            entry.mtime,  # c_mtime
            len(entry.content),  # c_filesize
            0,  # c_devmajor
            0,  # c_devminor
            0,  # c_rdevmajor
            0,  # c_rdevminor
            len(name_bytes),  # c_namesize
            0,  # c_check
        ]
        header = b"".join(convert_cpio(h) for h in header_elems) + name_bytes

        elems = []
        elems.extend(cpio_pad(header))
        elems.extend(cpio_pad(entry.content))
        return b"".join(elems)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("busybox", type=Path)
    parser.add_argument("initscript", type=Path)
    parser.add_argument("output_file", type=Path)
    parser.add_argument("modules", nargs="*", type=Path)
    args = parser.parse_args()

    busybox_content = args.busybox.read_bytes()
    initscript_content = args.initscript.read_bytes()

    archive = CPIOArchive()
    archive.add_entry(".", mode=0o755, type=Type.directory)
    archive.add_entry("bin", mode=0o755, type=Type.directory)
    archive.add_entry("bin/busybox", busybox_content, mode=0o755)

    for cmd in BUSYBOX_APPLETS:
        archive.add_entry(f"bin/{cmd}", b"busybox", mode=0o777, type=Type.symlink)

    archive.add_entry("init", initscript_content, mode=0o755)
    archive.add_entry("modules", mode=0o755, type=Type.directory)

    for module_path in args.modules:
        compressed_data = Path.read_bytes(module_path)
        decompressed_data = zstandard.decompress(compressed_data)
        module_filename = module_path.stem
        archive.add_entry(f"modules/{module_filename}", decompressed_data, mode=0o644)

    cpio_data = zstandard.compress(archive.generate())
    Path(args.output_file).write_bytes(cpio_data)


if __name__ == "__main__":
    raise SystemExit(main())

from tarfile import TarInfo
from io import BytesIO
from os import path
import tarfile
import fnmatch
import re


def extract_useful(ti):
    return (
        ti.name,
        ti.uid,
        ti.gid,
        ti.size,
        ti.type,
        ti.uname,
        ti.gname,
        ti.pax_headers,
    )


LOCALE_MATCHER = re.compile(fnmatch.translate("usr/share/locale/*/LC_MESSAGES/*.mo"))


def is_excluded(name):
    if name.startswith("usr/share/doc/"):
        return True

    if name.startswith("usr/share/man/"):
        return True

    return bool(LOCALE_MATCHER.match(name))


def write_file(out_fh, info, fh):
    if not info.isdir() and is_excluded(info.name):
        return

    out_fh.write(info.tobuf())
    tarfile.copyfileobj(fh, out_fh, info.size)
    blocks, remainder = divmod(info.size, tarfile.BLOCKSIZE)
    if remainder == 0:
        return

    out_fh.write(b"\0" * (tarfile.BLOCKSIZE - remainder))


def write_image(fs, out_fh):
    files = fs._files
    for name in sorted(files):
        write_file(out_fh, *files[name])


class Filesystem:
    def __init__(self):
        self._files = dict()

    def mkdir(self, name):
        ti = TarInfo(name)
        ti.type = tarfile.DIRTYPE
        ti.mode = 0o755
        self.add(ti)

    def symlink(self, name, target):
        ti = TarInfo(name)
        ti.type = tarfile.SYMTYPE
        ti.linkname = target
        self.add(ti)

    def file(self, name, contents, mode=None):
        ti = TarInfo(name)

        if isinstance(contents, str):
            contents = contents.encode()

        ti.size = len(contents)
        if mode is not None:
            ti.mode = mode
        self.add(ti, BytesIO(contents))

    def mknod(self, name, major, minor):
        ti = TarInfo(name)
        ti.type = tarfile.CHRTYPE
        ti.devmajor = major
        ti.devminor = minor
        self.add(ti)

    def _resolve(self, components):
        name = ""
        for c in components:
            name = path.normpath(path.join(name, c))

            try:
                entry = self._files[name]
            except KeyError:
                continue

            info, fh = entry
            if not info.issym():
                continue

            dirname = path.dirname(name)
            name = path.join(dirname, info.linkname)
            name = path.normpath(name).lstrip("/")

        return name

    def _build_path(self, name):
        components = name.lstrip("/").split("/")
        return self._resolve(components)

    def add(self, ti, fileobj=None):
        bname = path.basename(ti.name)
        parent = self._build_path(path.dirname(ti.name))
        if parent == ".":
            ti.name = bname
        else:
            if parent not in self._files:
                self.mkdir(parent)
            ti.name = f"{parent}/{bname}"

        ti.uname = ""
        ti.gname = ""

        if ti.name in self._files:
            existing, _ = self._files[ti.name]
            if existing.type == ti.type:
                existing.mtime = max(existing.mtime, ti.mtime)
                existing.mode |= ti.mode

            if extract_useful(ti) != extract_useful(existing):
                if existing.type == tarfile.SYMTYPE and ti.type == tarfile.DIRTYPE:
                    return

                raise RuntimeError(ti.name)

            return

        if ti.name == "":
            return

        if ti.name.startswith("/"):
            raise Exception(ti.name)

        self._files[ti.name] = (ti, fileobj)

    def write(self, *args):
        return write_image(self, *args)

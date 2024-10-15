#!/usr/bin/env python3
import sys
import os.path
import tarfile

def fsget(x):
    return None

def mutate_file(fsget, ti):
    original_entry = fsget(ti.name)
    if original_entry:
        original_mtime = original_entry[0].mtime
        ti.mtime = original_mtime
    else:
        ti.mtime = 0
    
    return True

def roundup_block(size):
    blocks = (size + 511) >> 9
    return blocks << 9

def convert_to_whiteout(ti):
    ret = tarfile.TarInfo()
    new_name = ".wh." + os.path.basename(ti.name)
    ret.name = os.path.join(os.path.dirname(ti.name), new_name)
    return ret

def output_filter(fs, in_fh, out_fh, handle_whiteout=False):
    whiteout_files = set()
    while True:
        buf = in_fh.read(tarfile.BLOCKSIZE)
        try:
            ti = tarfile.TarInfo.frombuf(buf, tarfile.ENCODING, "surrogateescape")
        except tarfile.EOFHeaderError:
            break

        if handle_whiteout:
            whiteout = False
            if ti.ischr() and ti.devmajor == 0 and ti.devminor == 0:
                whiteout_files.add(ti.name)
                whiteout = True
            if ti.linkname in whiteout_files:
                whiteout = True

            if whiteout:
                ti = convert_to_whiteout(ti)

        len_to_read = roundup_block(ti.size)
        destination = out_fh if mutate_file(fs, ti) else NullFile
        destination.write(ti.tobuf())
        tarfile.copyfileobj(in_fh, destination, len_to_read)
    
    out_fh.write(b"\0" * (tarfile.BLOCKSIZE * 2))
    out_fh.flush()


def main():
    in_fh = open(sys.argv[1], "rb")
    out_fh = open(sys.argv[2], "wb")
    return output_filter(lambda x: None, in_fh, out_fh)

if __name__ == '__main__':
    raise SystemExit(main())

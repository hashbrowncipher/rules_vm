#!/usr/bin/env python3
import argparse
import subprocess
from pathlib import Path
import os
import sys

def main():
    # Parse command-line arguments using argparse and automatically convert them to Path
    parser = argparse.ArgumentParser(description='Run QEMU with specified parameters.')
    parser.add_argument('output_file', type=Path, help='output file')
    parser.add_argument('kernel_image', help='kernel image')
    parser.add_argument('initramfs', help='initramfs image')
    parser.add_argument('mode', choices=["whole", "layer"])
    parser.add_argument('src_tarball', help='source tarballs', nargs='*')
    args = parser.parse_args()

    output_dir = args.output_file.parent

    # Build the QEMU command
    qemu_cmd = [
        "qemu-system-x86_64",
        "-accel", "kvm",
        "-kernel", args.kernel_image,
        "-initrd", args.initramfs,
        "-m", "512M",
        "-append", f'console=ttyS0 quiet panic=-1 -- {args.mode} {args.output_file.name}',
        "-nographic",
        "-no-reboot",
        "-virtfs", f"local,path={output_dir},mount_tag=output,security_model=none,id=output",
    ]

    index = 0
    for tarball in args.src_tarball:
        qemu_cmd.extend([
            "-drive",
            f"file={tarball},format=raw,if=virtio,index={index},readonly=on",
        ])
        index += 1

    log_file_path = output_dir / "log"

    try:
        with log_file_path.open("w") as log_file:
            subprocess.run(qemu_cmd, stdout=log_file, stderr=subprocess.STDOUT, check=True)
    except subprocess.CalledProcessError:
        pass

    if args.output_file.exists():
        return 0
    else:
        shared_dir = Path(os.environ.get('SHARED_DIR', output_dir))
        shared_log_file = shared_dir / "log"

        # If the log file exists, display its contents
        if shared_log_file.is_file():
            print(shared_log_file.read_text())
        else:
            print(f"Log file not found at {shared_log_file}")
        return 1

if __name__ == "__main__":
    raise SystemExit(main())

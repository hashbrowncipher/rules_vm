#!/bin/bash
set -euo pipefail
src_tarball="$1"
shift
kernel_image="$1"
shift
initramfs="$1"
shift
output_file="$1"
shift

output_dir="${output_file%/*}"
output_filename="${output_file##*/}"

# Run QEMU
qemu-system-x86_64 \
    -accel kvm \
    -kernel "${kernel_image}" \
    -initrd "${initramfs}" \
    -m "512M" \
    -append "console=ttyS0 quiet panic=-1 -- ${output_filename}" \
    -nographic \
    -no-reboot \
    -virtfs local,path="${output_dir}",mount_tag=output,security_model=none,id=output \
    -drive "file=${src_tarball},format=raw,if=virtio,index=0,readonly=on" \
    > "${output_dir}/log"

if [ -e "${output_file}" ]; then
  exit 0
fi

cat "${SHARED_DIR}/log"

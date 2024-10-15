#!/bin/sh
set -euo pipefail

# Mount proc and sysfs
mkdir /proc /sys
mount -t proc none /proc
mount -t sysfs none /sys
mount -t devtmpfs none /dev

set -- $(cat /proc/cmdline)
while [ "$1" != "--" ]; do
  shift
done
shift
mode="${1}"
shift
output_filename="${1}"

insmod /modules/9pnet.ko
rm /modules/9pnet.ko
insmod /modules/netfs.ko
rm /modules/netfs.ko
for i in /modules/*.ko; do
  insmod "${i}"
done

mkdir /output /rootfs-tar
mount -t 9p -o trans=virtio,version=9p2000.L output /output

mkdir /overlay
mount -t tmpfs -o size=90% tmpfs /overlay
mkdir /overlay/upper /overlay/lower /overlay/work

lowerdirs=""
for dev in /dev/vd*; do
    dev_name="${dev##*/}"
    extract_dir="/overlay/lower/$dev_name"
    mkdir -p "$extract_dir"
    dd "if=$dev" bs=4M | tar -xC "$extract_dir"
    lowerdirs="$lowerdirs:$extract_dir"
done

lowerdirs=${lowerdirs#:}
mount -t overlay overlay -o lowerdir=$lowerdirs,upperdir=/overlay/upper,workdir=/overlay/work /root

cd /root
mkdir -p proc sys dev
mount -t proc none proc
mount -t sysfs none sys
mount -t devtmpfs none dev

chroot . /init > /output/log
umount /root/proc
umount /root/sys
umount /root/dev

if [ "$mode" = "layer" ]; then
  to_tar="/overlay/upper"
else
  to_tar="/root"
fi
tar -cf "/output/${output_filename}" -C "${to_tar}" .

poweroff -f

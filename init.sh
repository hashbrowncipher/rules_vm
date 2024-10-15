#!/bin/sh
set -ex

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
output_filename="${1}"
shift

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
mount -t tmpfs tmpfs /overlay
mkdir /overlay/upper /overlay/lower /overlay/work

tar -xf /dev/vda -C /overlay/lower

mount -t overlay overlay -o lowerdir=/overlay/lower,upperdir=/overlay/upper,workdir=/overlay/work /root

cd /root
mkdir -p proc sys dev
mount -t proc none proc
mount -t sysfs none sys
mount -t devtmpfs none dev

chroot . /init > /output/log
umount /root/proc
umount /root/sys
umount /root/dev

cd /
tar -cf "/output/${output_filename}" -C /root .

poweroff -f

load("@bazel_skylib//lib:shell.bzl", "shell")

load("//:base-system.lock.bzl", _base_packages = "make_packages")
load("//:vm.lock.bzl", _vm_base_packages = "make_packages")
load("//:deb_rules.bzl", "deb_extract")
load("//:qemu_overlay.bzl", "qemu_overlay")

exports_files([
    "qemu_overlay_run.py",
    "input_rootfs.tar",
    "mkinitramfs.py",
    "make_installable.py",
    "assemble.py",
    "init.sh",
    # TODO: autogenerate
    "vm-packages-info",
])

# Step 1: assemble some packages into a base image

# Fetch some packages
_base_packages("base-packages")
_vm_base_packages("vm-packages")

genrule(
    name = "unprocessed-image",
    srcs = [
        "assemble.py",
        ":base-packages",
    ],
    outs = ["unprocessed-image.tar"],
    cmd = "$(location :assemble.py) \"$@\" $(locations :base-packages)",
)

# Step 2: use qemu to run post-install hooks

# we'll need a kernel (won't ship with final image)
deb_extract(
    name = "linux",
    deb_file = "@linux_image//file",
    file_paths = ["boot/vmlinuz-6.8.0-45-generic"],
    outputs = ["vmlinuz"],
)

# ...and some modules
deb_extract(
    name = "container-modules",
    deb_file = "@linux_modules//file",
    file_paths = [
        "lib/modules/6.8.0-45-generic/kernel/fs/9p/9p.ko.zst",
        "lib/modules/6.8.0-45-generic/kernel/fs/overlayfs/overlay.ko.zst",
        "lib/modules/6.8.0-45-generic/kernel/fs/netfs/netfs.ko.zst",
        "lib/modules/6.8.0-45-generic/kernel/net/9p/9pnet.ko.zst",
        "lib/modules/6.8.0-45-generic/kernel/net/9p/9pnet_virtio.ko.zst",
    ],
    outputs = [
        "9p.ko.zst",
        "overlay.ko.zst",
        "netfs.ko.zst",
        "9pnet.ko.zst",
        "9pnet_virtio.ko.zst",
    ],
)

# and we'll make an initramfs real quick
genrule(
    name = "initramfs",
    srcs = [
        "mkinitramfs.py",
        "busybox",
        "init.sh",
        "container-modules",
    ],
    outs = ["initramfs.cpio.zstd"],
    cmd = "$(location mkinitramfs.py) $(location busybox) $(location init.sh) \"$@\" $(locations container-modules)",
)

deb_extract(
    name = "busybox",
    deb_file = "@busybox_static//file",
    executable = True,
    file_paths = ["bin/busybox"],
    outputs = ["busybox-static"],
)

# Actually run qemu and save the output
qemu_overlay(
    name = "processed",
    kernel = ":vmlinuz",
    initramfs = ":initramfs",
    src_tarballs = [":unprocessed-image"],
)

# Step 3: Filter the output (modify mtimes)
genrule(
    name = "base-system",
    srcs = [
        "output_filter.py",
        ":processed",
    ],
    outs = ["base-system.tar"],
    cmd = "$(location output_filter.py) $(location :processed) \"$@\"",
)

# Step 4: Install some packages the normal way
genrule(
    name = "vm-installer",
    srcs = [
        "make_installable.py",
        ":vm-packages",
        ":vm-packages-info",
    ],
    outs = ["vm-installer.tar"],
    cmd = "$(location make_installable.py) \"$@\" systemd linux-image-virtual udev -- $(location vm-packages-info) $(locations :vm-packages)",
)


qemu_overlay(
    name = "vm-installed",
    kernel = ":vmlinuz",
    initramfs = ":initramfs",
    src_tarballs = [
    	":base-system",
        ":vm-installer",
    ],
    mode = "layer",
)

def qemu_overlay(name, kernel, initramfs, src_tarballs, mode = "whole"):
    srcs = [
        ":qemu_overlay_run.py",
        kernel,
        initramfs,
    ]
    srcs.extend(src_tarballs)
    args = [
        "$(location :qemu_overlay_run.py) \"$@\"",
        "$(location {})".format(kernel),
        "$(location {}) ".format(initramfs),
        mode,
    ]
    for src in src_tarballs:
        args.append("$(location {})".format(src))

    native.genrule(
        name = name,
        srcs = srcs,
        outs = ["{}.tar".format(name)],
        cmd = " ".join(args),
    )

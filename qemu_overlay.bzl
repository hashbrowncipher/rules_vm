def _qemu_overlay_impl(ctx):
    src_tarball = ctx.file.src_tarball
    runner = ctx.file.runner
    kernel_image = ctx.file.kernel_image
    initramfs = ctx.file.initramfs
    out_tarball = ctx.outputs.out_tarball

    # Command to execute
    cmd = """
    ./{runner} {src_tarball} {kernel_image} {initramfs} {out_tarball}
    """.format(
	runner = runner.path,
        src_tarball = src_tarball.path,
        kernel_image = kernel_image.path,
        initramfs = initramfs.path,
        out_tarball = out_tarball.path,
    )

    ctx.actions.run_shell(
        inputs = [src_tarball, kernel_image, initramfs, runner],
        outputs = [out_tarball],
        command = cmd,
        progress_message = "Running QEMU to transform tarball",
    )

qemu_overlay = rule(
    implementation = _qemu_overlay_impl,
    attrs = {
        "src_tarball": attr.label(allow_single_file=True),
        "runner": attr.label(allow_single_file=True),
        "kernel_image": attr.label(allow_single_file=True),
        "initramfs": attr.label(allow_single_file=True),
        "out_tarball": attr.output(mandatory=True),
    },
)

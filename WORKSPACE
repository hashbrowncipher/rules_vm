load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_file")
load("packages-workspace.bzl", "load_packages")

http_file(
    name = "busybox_static",
    urls = ["http://archive.ubuntu.com/ubuntu/pool/main/b/busybox/busybox-static_1.36.1-3ubuntu1_amd64.deb"],
    sha256 = "595826b8f7a94971cfe717000762dcaa956849d1ffbdbeee7e5f4c2a9e4bfed1",
)

http_file(
    name = "linux_image",
    urls = ["http://archive.ubuntu.com/ubuntu/pool/main/l/linux-signed/linux-image-6.8.0-45-generic_6.8.0-45.45_amd64.deb"],
    sha256 = "4e2ea68d06ddda7de692ccfa052f2fbe58f34bf068c2009f7b3a10d5fd6f54c7",
)

http_file(
    name = "linux_modules",
    urls = ["http://archive.ubuntu.com/ubuntu/pool/main/l/linux/linux-modules-6.8.0-45-generic_6.8.0-45.45_amd64.deb"],
    sha256 = "6d3438855a9920a7ba53ff1787edd5ebfa13802569a71dd5c126baf18de728c1",
)

load_packages()

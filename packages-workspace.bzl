load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_file")

def load_packages():
    # Size: 314760
    http_file(
        name = "units_2.23-1build2_amd64",
        urls = ["http://archive.ubuntu.com/ubuntu/pool/universe/u/units/units_2.23-1build2_amd64.deb"],
        downloaded_file_path = "units_2.23-1build2_amd64.deb",
        sha256 = "6474336b7b6aff8d6d4daa575df48b7043931894b100472347b5e846e2f587de",
    )

    # Size: 1374960
    http_file(
        name = "apt_2.7.14build2_amd64",
        urls = ["http://archive.ubuntu.com/ubuntu/pool/main/a/apt/apt_2.7.14build2_amd64.deb"],
        downloaded_file_path = "apt_2.7.14build2_amd64.deb",
        sha256 = "72b4e9ba826544fa87e9101857432ebfa61c29ec4e091fcd67396cde9b9c6459",
    )

    # Size: 73188
    http_file(
        name = "base-files_13ubuntu10.1_amd64",
        urls = ["http://archive.ubuntu.com/ubuntu/pool/main/b/base-files/base-files_13ubuntu10.1_amd64.deb"],
        downloaded_file_path = "base-files_13ubuntu10.1_amd64.deb",
        sha256 = "436e9c5b675487852d577fde1eacda19025c14fc13e0f268ec7c2d837d939447",
    )

    # Size: 51060
    http_file(
        name = "base-passwd_3.6.3build1_amd64",
        urls = ["http://archive.ubuntu.com/ubuntu/pool/main/b/base-passwd/base-passwd_3.6.3build1_amd64.deb"],
        downloaded_file_path = "base-passwd_3.6.3build1_amd64.deb",
        sha256 = "8514590aa2d82aa32d6beb32525f1e4577949f625eee1990b4b7b71b5ef26679",
    )

    # Size: 794086
    http_file(
        name = "bash_5.2.21-2ubuntu4_amd64",
        urls = ["http://archive.ubuntu.com/ubuntu/pool/main/b/bash/bash_5.2.21-2ubuntu4_amd64.deb"],
        downloaded_file_path = "bash_5.2.21-2ubuntu4_amd64.deb",
        sha256 = "73de311a21e094e29ac01527d2b52226cc87fde0a5b57032902251b426d92c66",
    )

    # Size: 95404
    http_file(
        name = "bsdutils_2.39.3-9ubuntu6.1_amd64",
        urls = ["http://archive.ubuntu.com/ubuntu/pool/main/u/util-linux/bsdutils_2.39.3-9ubuntu6.1_amd64.deb"],
        downloaded_file_path = "bsdutils_2.39.3-9ubuntu6.1_amd64.deb",
        sha256 = "7cdb7a60c8d20942f41e3998d54c95d5d07d4edada0af0ad80392d01139052e6",
    )

    # Size: 1412418
    http_file(
        name = "coreutils_9.4-3ubuntu6_amd64",
        urls = ["http://archive.ubuntu.com/ubuntu/pool/main/c/coreutils/coreutils_9.4-3ubuntu6_amd64.deb"],
        downloaded_file_path = "coreutils_9.4-3ubuntu6_amd64.deb",
        sha256 = "0d19c3e94f04ff1aafde46701fe1783da0a068a4904adc3794c30140f1aaeb8f",
    )

    # Size: 89836
    http_file(
        name = "dash_0.5.12-6ubuntu5_amd64",
        urls = ["http://archive.ubuntu.com/ubuntu/pool/main/d/dash/dash_0.5.12-6ubuntu5_amd64.deb"],
        downloaded_file_path = "dash_0.5.12-6ubuntu5_amd64.deb",
        sha256 = "e97728d8deaa51300255f0572bbd68b9549e0894a184c056dc420fc4e0ba0781",
    )

    # Size: 124096
    http_file(
        name = "debconf_1.5.86ubuntu1_all",
        urls = ["http://archive.ubuntu.com/ubuntu/pool/main/d/debconf/debconf_1.5.86ubuntu1_all.deb"],
        downloaded_file_path = "debconf_1.5.86ubuntu1_all.deb",
        sha256 = "bb390da466a7461bfc87aa3e6b7cd145dae84af3e26bf437f2c0c218ba226294",
    )

    # Size: 89890
    http_file(
        name = "debianutils_5.17build1_amd64",
        urls = ["http://archive.ubuntu.com/ubuntu/pool/main/d/debianutils/debianutils_5.17build1_amd64.deb"],
        downloaded_file_path = "debianutils_5.17build1_amd64.deb",
        sha256 = "1047a9a57018e18531f76e5b00e226a68554b6f1d147f2a5c1b32518c7b20636",
    )

    # Size: 176846
    http_file(
        name = "diffutils_3.10-1build1_amd64",
        urls = ["http://archive.ubuntu.com/ubuntu/pool/main/d/diffutils/diffutils_3.10-1build1_amd64.deb"],
        downloaded_file_path = "diffutils_3.10-1build1_amd64.deb",
        sha256 = "f9b8ff6528114ba4c6a9ec94570c838a266f9f196969ae08f310725fa830d958",
    )

    # Size: 1283236
    http_file(
        name = "dpkg_1.22.6ubuntu6.1_amd64",
        urls = ["http://archive.ubuntu.com/ubuntu/pool/main/d/dpkg/dpkg_1.22.6ubuntu6.1_amd64.deb"],
        downloaded_file_path = "dpkg_1.22.6ubuntu6.1_amd64.deb",
        sha256 = "77d50443e904c1d9509668194fc5fd1cbd475853727c991a0dd7f88e8b273223",
    )

    # Size: 600736
    http_file(
        name = "e2fsprogs_1.47.0-2.4~~exp1ubuntu4.1_amd64",
        urls = ["http://archive.ubuntu.com/ubuntu/pool/main/e/e2fsprogs/e2fsprogs_1.47.0-2.4~exp1ubuntu4.1_amd64.deb"],
        downloaded_file_path = "e2fsprogs_1.47.0-2.4~exp1ubuntu4.1_amd64.deb",
        sha256 = "1d0fb19dcf14316d04602260871dba3c1441c0ecf3c3bde54eacba35dcc5a40b",
    )

    # Size: 298296
    http_file(
        name = "findutils_4.9.0-5build1_amd64",
        urls = ["http://archive.ubuntu.com/ubuntu/pool/main/f/findutils/findutils_4.9.0-5build1_amd64.deb"],
        downloaded_file_path = "findutils_4.9.0-5build1_amd64.deb",
        sha256 = "96490acdee09245bb47ff4684dc59a7ac3b29619da868ef3e9d8323c61a02ac4",
    )

    # Size: 47612
    http_file(
        name = "gcc-14-base_14-20240412-0ubuntu1_amd64",
        urls = ["http://archive.ubuntu.com/ubuntu/pool/main/g/gcc-14/gcc-14-base_14-20240412-0ubuntu1_amd64.deb"],
        downloaded_file_path = "gcc-14-base_14-20240412-0ubuntu1_amd64.deb",
        sha256 = "bc5a682c694a1ce5af50772b7c737a21e9a74f0f0edaae98e97bc9c4af583fef",
    )

    # Size: 157184
    http_file(
        name = "gpgv_2.4.4-2ubuntu17_amd64",
        urls = ["http://archive.ubuntu.com/ubuntu/pool/main/g/gnupg2/gpgv_2.4.4-2ubuntu17_amd64.deb"],
        downloaded_file_path = "gpgv_2.4.4-2ubuntu17_amd64.deb",
        sha256 = "59303f676f8002f2c82698ba76037f8dab4debad2c19619bf4d78bb817201a27",
    )

    # Size: 162040
    http_file(
        name = "grep_3.11-4build1_amd64",
        urls = ["http://archive.ubuntu.com/ubuntu/pool/main/g/grep/grep_3.11-4build1_amd64.deb"],
        downloaded_file_path = "grep_3.11-4build1_amd64.deb",
        sha256 = "fc0fdc5983ea3d3579ccf335e51dec69684a0dd9bb915734999c5733add9507a",
    )

    # Size: 98850
    http_file(
        name = "gzip_1.12-1ubuntu3_amd64",
        urls = ["http://archive.ubuntu.com/ubuntu/pool/main/g/gzip/gzip_1.12-1ubuntu3_amd64.deb"],
        downloaded_file_path = "gzip_1.12-1ubuntu3_amd64.deb",
        sha256 = "d38bb6657d6bd909422ec862c268fb44256eb50df27a8229ceb525cdfafe92a4",
    )

    # Size: 11058
    http_file(
        name = "hostname_3.23~2b.nmu2ubuntu2_amd64",
        urls = ["http://archive.ubuntu.com/ubuntu/pool/main/h/hostname/hostname_3.23+nmu2ubuntu2_amd64.deb"],
        downloaded_file_path = "hostname_3.23+nmu2ubuntu2_amd64.deb",
        sha256 = "c9b3109d868c1e5a26f0bd10e005171420d83f6da84a527aa6293bc350892504",
    )

    # Size: 39402
    http_file(
        name = "init-system-helpers_1.66ubuntu1_all",
        urls = ["http://archive.ubuntu.com/ubuntu/pool/main/i/init-system-helpers/init-system-helpers_1.66ubuntu1_all.deb"],
        downloaded_file_path = "init-system-helpers_1.66ubuntu1_all.deb",
        sha256 = "8eb801f9ce084dab9bf4cbc3ec0ee5ac75516a4cc1f25e3f92298c632e75b700",
    )

    # Size: 16794
    http_file(
        name = "libacl1_2.3.2-1build1_amd64",
        urls = ["http://archive.ubuntu.com/ubuntu/pool/main/a/acl/libacl1_2.3.2-1build1_amd64.deb"],
        downloaded_file_path = "libacl1_2.3.2-1build1_amd64.deb",
        sha256 = "892dd9edaded972367e19713e5b0a3144409d9ef6613da5b7734a56f8e8f582b",
    )

    # Size: 985310
    http_file(
        name = "libapt-pkg6.0t64_2.7.14build2_amd64",
        urls = ["http://archive.ubuntu.com/ubuntu/pool/main/a/apt/libapt-pkg6.0t64_2.7.14build2_amd64.deb"],
        downloaded_file_path = "libapt-pkg6.0t64_2.7.14build2_amd64.deb",
        sha256 = "3915b0cdfbaae551d9089400f47be749b89c30914985982b39e57fd2016be852",
    )

    # Size: 37256
    http_file(
        name = "libassuan0_2.5.6-1build1_amd64",
        urls = ["http://archive.ubuntu.com/ubuntu/pool/main/liba/libassuan/libassuan0_2.5.6-1build1_amd64.deb"],
        downloaded_file_path = "libassuan0_2.5.6-1build1_amd64.deb",
        sha256 = "59c6ee6aa6fffb5d181f37373baec18c26791f5d1c907ceeb62163460b11daf2",
    )

    # Size: 11326
    http_file(
        name = "libattr1_2.5.2-1build1_amd64",
        urls = ["http://archive.ubuntu.com/ubuntu/pool/main/a/attr/libattr1_2.5.2-1build1_amd64.deb"],
        downloaded_file_path = "libattr1_2.5.2-1build1_amd64.deb",
        sha256 = "204e45dde86d1cf762114bd91fdab9d820de08e3da8216c7b25382924a96aa9f",
    )

    # Size: 5736
    http_file(
        name = "libaudit-common_3.1.2-2.1build1_all",
        urls = ["http://archive.ubuntu.com/ubuntu/pool/main/a/audit/libaudit-common_3.1.2-2.1build1_all.deb"],
        downloaded_file_path = "libaudit-common_3.1.2-2.1build1_all.deb",
        sha256 = "f2dd99597b416cff8cefeb350c1e4eb7e15fc6f7a57cd37f4a4c11f4a8049a92",
    )

    # Size: 46880
    http_file(
        name = "libaudit1_3.1.2-2.1build1_amd64",
        urls = ["http://archive.ubuntu.com/ubuntu/pool/main/a/audit/libaudit1_3.1.2-2.1build1_amd64.deb"],
        downloaded_file_path = "libaudit1_3.1.2-2.1build1_amd64.deb",
        sha256 = "ab7708324073d0978b3355e0bc265192c57711e81847d01458c305332ea7f98e",
    )

    # Size: 122322
    http_file(
        name = "libblkid1_2.39.3-9ubuntu6.1_amd64",
        urls = ["http://archive.ubuntu.com/ubuntu/pool/main/u/util-linux/libblkid1_2.39.3-9ubuntu6.1_amd64.deb"],
        downloaded_file_path = "libblkid1_2.39.3-9ubuntu6.1_amd64.deb",
        sha256 = "17cd545f7011331d837c48dc541cc2eee47950abe5539d33939c2842c7773fe4",
    )

    # Size: 34370
    http_file(
        name = "libbz2-1.0_1.0.8-5.1build0.1_amd64",
        urls = ["http://archive.ubuntu.com/ubuntu/pool/main/b/bzip2/libbz2-1.0_1.0.8-5.1build0.1_amd64.deb"],
        downloaded_file_path = "libbz2-1.0_1.0.8-5.1build0.1_amd64.deb",
        sha256 = "d557ab12b42ab370249142099fae3cbb979948934e4dfa58c2ab59bf5bbbda73",
    )

    # Size: 722214
    http_file(
        name = "libc-bin_2.39-0ubuntu8.3_amd64",
        urls = ["http://archive.ubuntu.com/ubuntu/pool/main/g/glibc/libc-bin_2.39-0ubuntu8.3_amd64.deb"],
        downloaded_file_path = "libc-bin_2.39-0ubuntu8.3_amd64.deb",
        sha256 = "80501c003119754ae060ecebcfedf5ab8746bb9f8bd664e6e5766106916ed8b8",
    )

    # Size: 3265056
    http_file(
        name = "libc6_2.39-0ubuntu8.3_amd64",
        urls = ["http://archive.ubuntu.com/ubuntu/pool/main/g/glibc/libc6_2.39-0ubuntu8.3_amd64.deb"],
        downloaded_file_path = "libc6_2.39-0ubuntu8.3_amd64.deb",
        sha256 = "84cd7925cb7773471f09810cbebcd796f2fd33a07cb761a64116eeb7b9096a2f",
    )

    # Size: 15180
    http_file(
        name = "libcap-ng0_0.8.4-2build2_amd64",
        urls = ["http://archive.ubuntu.com/ubuntu/pool/main/libc/libcap-ng/libcap-ng0_0.8.4-2build2_amd64.deb"],
        downloaded_file_path = "libcap-ng0_0.8.4-2build2_amd64.deb",
        sha256 = "cf1e9437ac7ddf6539dbe87b68858cbdef84d78c6aac243ab3b6e564a52ed930",
    )

    # Size: 29998
    http_file(
        name = "libcap2_2.66-5ubuntu2_amd64",
        urls = ["http://archive.ubuntu.com/ubuntu/pool/main/libc/libcap2/libcap2_2.66-5ubuntu2_amd64.deb"],
        downloaded_file_path = "libcap2_2.66-5ubuntu2_amd64.deb",
        sha256 = "a6cce0b5f149707a6359e4f03a05fb7417c5e1d3fde9e12c651e804b4c479bbb",
    )

    # Size: 22982
    http_file(
        name = "libcom-err2_1.47.0-2.4~~exp1ubuntu4.1_amd64",
        urls = ["http://archive.ubuntu.com/ubuntu/pool/main/e/e2fsprogs/libcom-err2_1.47.0-2.4~exp1ubuntu4.1_amd64.deb"],
        downloaded_file_path = "libcom-err2_1.47.0-2.4~exp1ubuntu4.1_amd64.deb",
        sha256 = "7ab24d3057dabf86db8f771ad6e43f073ed86b6b950d6e8ba22cb9fe6707bbc9",
    )

    # Size: 82302
    http_file(
        name = "libcrypt1_4.4.36-4build1_amd64",
        urls = ["http://archive.ubuntu.com/ubuntu/pool/main/libx/libxcrypt/libcrypt1_4.4.36-4build1_amd64.deb"],
        downloaded_file_path = "libcrypt1_4.4.36-4build1_amd64.deb",
        sha256 = "9474785cd6f398512bf8c305c3901dbb111569dccb6f5832002373c0a8ac5832",
    )

    # Size: 734100
    http_file(
        name = "libdb5.3t64_5.3.28~2b.dfsg2-7_amd64",
        urls = ["http://archive.ubuntu.com/ubuntu/pool/main/d/db5.3/libdb5.3t64_5.3.28+dfsg2-7_amd64.deb"],
        downloaded_file_path = "libdb5.3t64_5.3.28+dfsg2-7_amd64.deb",
        sha256 = "a78a25c8fad8fdd0b7bc6b297da5d5685579be1e57732aa47870830e4a13161e",
    )

    # Size: 11398
    http_file(
        name = "libdebconfclient0_0.271ubuntu3_amd64",
        urls = ["http://archive.ubuntu.com/ubuntu/pool/main/c/cdebconf/libdebconfclient0_0.271ubuntu3_amd64.deb"],
        downloaded_file_path = "libdebconfclient0_0.271ubuntu3_amd64.deb",
        sha256 = "0a07d284ca6e2ee18208b3bf9ddc19da803d96db8230cdf26d16ac3aae5b7893",
    )

    # Size: 221728
    http_file(
        name = "libext2fs2t64_1.47.0-2.4~~exp1ubuntu4.1_amd64",
        urls = ["http://archive.ubuntu.com/ubuntu/pool/main/e/e2fsprogs/libext2fs2t64_1.47.0-2.4~exp1ubuntu4.1_amd64.deb"],
        downloaded_file_path = "libext2fs2t64_1.47.0-2.4~exp1ubuntu4.1_amd64.deb",
        sha256 = "276686704314749497f1530ff9e62fd0280328be786a28db0cfe2aa31c88119e",
    )

    # Size: 24718
    http_file(
        name = "libffi8_3.4.6-1build1_amd64",
        urls = ["http://archive.ubuntu.com/ubuntu/pool/main/libf/libffi/libffi8_3.4.6-1build1_amd64.deb"],
        downloaded_file_path = "libffi8_3.4.6-1build1_amd64.deb",
        sha256 = "637e6a7744de08cd331a41f4efd0d24e6ea9064843dea9d1c6ca87bdb5f038a2",
    )

    # Size: 78484
    http_file(
        name = "libgcc-s1_14-20240412-0ubuntu1_amd64",
        urls = ["http://archive.ubuntu.com/ubuntu/pool/main/g/gcc-14/libgcc-s1_14-20240412-0ubuntu1_amd64.deb"],
        downloaded_file_path = "libgcc-s1_14-20240412-0ubuntu1_amd64.deb",
        sha256 = "a39efdcaa2245f026dc3254ce14fcff255fc430a17064632b6ba7c5da974a912",
    )

    # Size: 532180
    http_file(
        name = "libgcrypt20_1.10.3-2build1_amd64",
        urls = ["http://archive.ubuntu.com/ubuntu/pool/main/libg/libgcrypt20/libgcrypt20_1.10.3-2build1_amd64.deb"],
        downloaded_file_path = "libgcrypt20_1.10.3-2build1_amd64.deb",
        sha256 = "ff32bae487706ba6ca646b5b72d89b935e3b8b2811d02e4ad7360cb97d90e2d0",
    )

    # Size: 253448
    http_file(
        name = "libgmp10_6.3.0~2b.dfsg-2ubuntu6_amd64",
        urls = ["http://archive.ubuntu.com/ubuntu/pool/main/g/gmp/libgmp10_6.3.0+dfsg-2ubuntu6_amd64.deb"],
        downloaded_file_path = "libgmp10_6.3.0+dfsg-2ubuntu6_amd64.deb",
        sha256 = "649a5ee5f74f0aa1e1b9c4f169eabbae56a79aa5aac51ef733eb9e18700bd8fc",
    )

    # Size: 997612
    http_file(
        name = "libgnutls30t64_3.8.3-1.1ubuntu3.2_amd64",
        urls = ["http://archive.ubuntu.com/ubuntu/pool/main/g/gnutls28/libgnutls30t64_3.8.3-1.1ubuntu3.2_amd64.deb"],
        downloaded_file_path = "libgnutls30t64_3.8.3-1.1ubuntu3.2_amd64.deb",
        sha256 = "3f760e23d1ff0584d3cb7ea0ba7a3495d89198020a5d459ebc8af3c005284357",
    )

    # Size: 69990
    http_file(
        name = "libgpg-error0_1.47-3build2_amd64",
        urls = ["http://archive.ubuntu.com/ubuntu/pool/main/libg/libgpg-error/libgpg-error0_1.47-3build2_amd64.deb"],
        downloaded_file_path = "libgpg-error0_1.47-3build2_amd64.deb",
        sha256 = "81a30b5888e0af43b72bfdbdb44209b82e521eadf8848ff201542e6d258f6a1f",
    )

    # Size: 198548
    http_file(
        name = "libhogweed6t64_3.9.1-2.2build1.1_amd64",
        urls = ["http://archive.ubuntu.com/ubuntu/pool/main/n/nettle/libhogweed6t64_3.9.1-2.2build1.1_amd64.deb"],
        downloaded_file_path = "libhogweed6t64_3.9.1-2.2build1.1_amd64.deb",
        sha256 = "a9b5f7e9d49ba9060e1c933567046fbc6feab6096799cbf550b7214dc9b0f49b",
    )

    # Size: 66158
    http_file(
        name = "libidn2-0_2.3.7-2build1_amd64",
        urls = ["http://archive.ubuntu.com/ubuntu/pool/main/libi/libidn2/libidn2-0_2.3.7-2build1_amd64.deb"],
        downloaded_file_path = "libidn2-0_2.3.7-2build1_amd64.deb",
        sha256 = "f1be32391a2fabf06c27618a2000ae8f9a26c30fad1b482a007049ae8156d19c",
    )

    # Size: 63062
    http_file(
        name = "liblz4-1_1.9.4-1build1.1_amd64",
        urls = ["http://archive.ubuntu.com/ubuntu/pool/main/l/lz4/liblz4-1_1.9.4-1build1.1_amd64.deb"],
        downloaded_file_path = "liblz4-1_1.9.4-1build1.1_amd64.deb",
        sha256 = "319331270d5cc52d5ebffe51c941d7b01b432bc402c2924b557209a64d4ecbad",
    )

    # Size: 127048
    http_file(
        name = "liblzma5_5.6.1~2b.really5.4.5-1build0.1_amd64",
        urls = ["http://archive.ubuntu.com/ubuntu/pool/main/x/xz-utils/liblzma5_5.6.1+really5.4.5-1build0.1_amd64.deb"],
        downloaded_file_path = "liblzma5_5.6.1+really5.4.5-1build0.1_amd64.deb",
        sha256 = "8b4fc33023de9a7b82621d6078ecf7e97cb40c204b5a6161039f8e077a03be58",
    )

    # Size: 27002
    http_file(
        name = "libmd0_1.1.0-2build1_amd64",
        urls = ["http://archive.ubuntu.com/ubuntu/pool/main/libm/libmd/libmd0_1.1.0-2build1_amd64.deb"],
        downloaded_file_path = "libmd0_1.1.0-2build1_amd64.deb",
        sha256 = "77f8cdbf03a43656bbf6604e18bd16834fc8bf2c949d4fbdf24ac297869b667a",
    )

    # Size: 133972
    http_file(
        name = "libmount1_2.39.3-9ubuntu6.1_amd64",
        urls = ["http://archive.ubuntu.com/ubuntu/pool/main/u/util-linux/libmount1_2.39.3-9ubuntu6.1_amd64.deb"],
        downloaded_file_path = "libmount1_2.39.3-9ubuntu6.1_amd64.deb",
        sha256 = "21b23d024690c602a6c9e816ee32bbe6c6eed9e57c1cdc3b568b06a2295b93c5",
    )

    # Size: 147842
    http_file(
        name = "libncursesw6_6.4~2b.20240113-1ubuntu2_amd64",
        urls = ["http://archive.ubuntu.com/ubuntu/pool/main/n/ncurses/libncursesw6_6.4+20240113-1ubuntu2_amd64.deb"],
        downloaded_file_path = "libncursesw6_6.4+20240113-1ubuntu2_amd64.deb",
        sha256 = "96d1e64bb1a80f2005f41c4112d10e4756a222a6c245e9383fc8da924bd40bf9",
    )

    # Size: 181636
    http_file(
        name = "libnettle8t64_3.9.1-2.2build1.1_amd64",
        urls = ["http://archive.ubuntu.com/ubuntu/pool/main/n/nettle/libnettle8t64_3.9.1-2.2build1.1_amd64.deb"],
        downloaded_file_path = "libnettle8t64_3.9.1-2.2build1.1_amd64.deb",
        sha256 = "6d97fbc1972633083f08f51ccab433606c97bbceb897c631c66495117ca3406f",
    )

    # Size: 8378
    http_file(
        name = "libnpth0t64_1.6-3.1build1_amd64",
        urls = ["http://archive.ubuntu.com/ubuntu/pool/main/n/npth/libnpth0t64_1.6-3.1build1_amd64.deb"],
        downloaded_file_path = "libnpth0t64_1.6-3.1build1_amd64.deb",
        sha256 = "b380eca1221a9ac855427652452801c5ca9161dd69e12446d300524eba00944e",
    )

    # Size: 299534
    http_file(
        name = "libp11-kit0_0.25.3-4ubuntu2.1_amd64",
        urls = ["http://archive.ubuntu.com/ubuntu/pool/main/p/p11-kit/libp11-kit0_0.25.3-4ubuntu2.1_amd64.deb"],
        downloaded_file_path = "libp11-kit0_0.25.3-4ubuntu2.1_amd64.deb",
        sha256 = "151a0e70407faef701df3a283bca0b2f2e7aeb2b73e5682101bb5543e8213d98",
    )

    # Size: 283892
    http_file(
        name = "libpam-modules_1.5.3-5ubuntu5.1_amd64",
        urls = ["http://archive.ubuntu.com/ubuntu/pool/main/p/pam/libpam-modules_1.5.3-5ubuntu5.1_amd64.deb"],
        downloaded_file_path = "libpam-modules_1.5.3-5ubuntu5.1_amd64.deb",
        sha256 = "0ee5b60ae6fa66d5360dd13fabc7aaa56ef80368e3eca928b32815870a0de2cd",
    )

    # Size: 51868
    http_file(
        name = "libpam-modules-bin_1.5.3-5ubuntu5.1_amd64",
        urls = ["http://archive.ubuntu.com/ubuntu/pool/main/p/pam/libpam-modules-bin_1.5.3-5ubuntu5.1_amd64.deb"],
        downloaded_file_path = "libpam-modules-bin_1.5.3-5ubuntu5.1_amd64.deb",
        sha256 = "e591115e507b522f4e4bcc0bd4463dbad3d3340e9526fde93ce3a76350348fb1",
    )

    # Size: 40770
    http_file(
        name = "libpam-runtime_1.5.3-5ubuntu5.1_all",
        urls = ["http://archive.ubuntu.com/ubuntu/pool/main/p/pam/libpam-runtime_1.5.3-5ubuntu5.1_all.deb"],
        downloaded_file_path = "libpam-runtime_1.5.3-5ubuntu5.1_all.deb",
        sha256 = "7d6748cce702d8c4ed2db0ab179ff36a657ef3a3bdb409a98402e15c2c83d732",
    )

    # Size: 67724
    http_file(
        name = "libpam0g_1.5.3-5ubuntu5.1_amd64",
        urls = ["http://archive.ubuntu.com/ubuntu/pool/main/p/pam/libpam0g_1.5.3-5ubuntu5.1_amd64.deb"],
        downloaded_file_path = "libpam0g_1.5.3-5ubuntu5.1_amd64.deb",
        sha256 = "bf7eff25ec3fa9fe30d247610fcfa97f62b19a0040624d7a1c32e7ec442c7ab4",
    )

    # Size: 226574
    http_file(
        name = "libpcre2-8-0_10.42-4ubuntu2_amd64",
        urls = ["http://archive.ubuntu.com/ubuntu/pool/main/p/pcre2/libpcre2-8-0_10.42-4ubuntu2_amd64.deb"],
        downloaded_file_path = "libpcre2-8-0_10.42-4ubuntu2_amd64.deb",
        sha256 = "bb38c38adb4ef548f2851b5cf7f70bbdbcb27d582c17550aa053edb9e4098d84",
    )

    # Size: 59454
    http_file(
        name = "libproc2-0_4.0.4-4ubuntu3.2_amd64",
        urls = ["http://archive.ubuntu.com/ubuntu/pool/main/p/procps/libproc2-0_4.0.4-4ubuntu3.2_amd64.deb"],
        downloaded_file_path = "libproc2-0_4.0.4-4ubuntu3.2_amd64.deb",
        sha256 = "52684291f6bb77a0a72c893f5c00c0742c30105d93e1f885566f4521b1f97946",
    )

    # Size: 152856
    http_file(
        name = "libreadline8t64_8.2-4build1_amd64",
        urls = ["http://archive.ubuntu.com/ubuntu/pool/main/r/readline/libreadline8t64_8.2-4build1_amd64.deb"],
        downloaded_file_path = "libreadline8t64_8.2-4build1_amd64.deb",
        sha256 = "563977a16df03b611f5239cc1e9a0426e86479fcc616b5c9e200ea32063119e5",
    )

    # Size: 50424
    http_file(
        name = "libseccomp2_2.5.5-1ubuntu3.1_amd64",
        urls = ["http://archive.ubuntu.com/ubuntu/pool/main/libs/libseccomp/libseccomp2_2.5.5-1ubuntu3.1_amd64.deb"],
        downloaded_file_path = "libseccomp2_2.5.5-1ubuntu3.1_amd64.deb",
        sha256 = "33fc96f1e008d27c042a3db9bcd16f7f4d49e866f7a3141b758a799328dbdc3f",
    )

    # Size: 79578
    http_file(
        name = "libselinux1_3.5-2ubuntu2_amd64",
        urls = ["http://archive.ubuntu.com/ubuntu/pool/main/libs/libselinux/libselinux1_3.5-2ubuntu2_amd64.deb"],
        downloaded_file_path = "libselinux1_3.5-2ubuntu2_amd64.deb",
        sha256 = "c0fe6dfac61d458f3e65c4a2bf6a920030a97d2429e33d0b405a8c4a63ef2864",
    )

    # Size: 10144
    http_file(
        name = "libsemanage-common_3.5-1build5_all",
        urls = ["http://archive.ubuntu.com/ubuntu/pool/main/libs/libsemanage/libsemanage-common_3.5-1build5_all.deb"],
        downloaded_file_path = "libsemanage-common_3.5-1build5_all.deb",
        sha256 = "e10cd93f0b6941566de04b860b723df57ca3fe4a9255a73b2be0d1dc7df2850e",
    )

    # Size: 93178
    http_file(
        name = "libsemanage2_3.5-1build5_amd64",
        urls = ["http://archive.ubuntu.com/ubuntu/pool/main/libs/libsemanage/libsemanage2_3.5-1build5_amd64.deb"],
        downloaded_file_path = "libsemanage2_3.5-1build5_amd64.deb",
        sha256 = "56102dcbd410416d03c5ffb80958f54ac63936f4d9eb3f6a98964e680a82ce37",
    )

    # Size: 302950
    http_file(
        name = "libsepol2_3.5-2build1_amd64",
        urls = ["http://archive.ubuntu.com/ubuntu/pool/main/libs/libsepol/libsepol2_3.5-2build1_amd64.deb"],
        downloaded_file_path = "libsepol2_3.5-2build1_amd64.deb",
        sha256 = "47272bab0c2fcc350431f9a8ae63afc49ce6d7e71e63c914639fbda6b1ca9f6a",
    )

    # Size: 64896
    http_file(
        name = "libsmartcols1_2.39.3-9ubuntu6.1_amd64",
        urls = ["http://archive.ubuntu.com/ubuntu/pool/main/u/util-linux/libsmartcols1_2.39.3-9ubuntu6.1_amd64.deb"],
        downloaded_file_path = "libsmartcols1_2.39.3-9ubuntu6.1_amd64.deb",
        sha256 = "74f80b36682cd331f5290fa894e9a841701f001b895d35b62d54fd9a9d5432d5",
    )

    # Size: 16976
    http_file(
        name = "libss2_1.47.0-2.4~~exp1ubuntu4.1_amd64",
        urls = ["http://archive.ubuntu.com/ubuntu/pool/main/e/e2fsprogs/libss2_1.47.0-2.4~exp1ubuntu4.1_amd64.deb"],
        downloaded_file_path = "libss2_1.47.0-2.4~exp1ubuntu4.1_amd64.deb",
        sha256 = "e3b6140b815970461c4312f1dc3d6b1f0d62d99f4ebe2ad087bffa630010035a",
    )

    # Size: 1940128
    http_file(
        name = "libssl3t64_3.0.13-0ubuntu3.4_amd64",
        urls = ["http://archive.ubuntu.com/ubuntu/pool/main/o/openssl/libssl3t64_3.0.13-0ubuntu3.4_amd64.deb"],
        downloaded_file_path = "libssl3t64_3.0.13-0ubuntu3.4_amd64.deb",
        sha256 = "460131a068304561137c0447b6710438a80945202336f86f28ffab6891b1d1f1",
    )

    # Size: 795158
    http_file(
        name = "libstdc~2b.~2b.6_14-20240412-0ubuntu1_amd64",
        urls = ["http://archive.ubuntu.com/ubuntu/pool/main/g/gcc-14/libstdc++6_14-20240412-0ubuntu1_amd64.deb"],
        downloaded_file_path = "libstdc++6_14-20240412-0ubuntu1_amd64.deb",
        sha256 = "4863e880d6ee538e4734c430c5579c1ac933b88a42c25bc9980d0f148c54b21e",
    )

    # Size: 433004
    http_file(
        name = "libsystemd0_255.4-1ubuntu8.4_amd64",
        urls = ["http://archive.ubuntu.com/ubuntu/pool/main/s/systemd/libsystemd0_255.4-1ubuntu8.4_amd64.deb"],
        downloaded_file_path = "libsystemd0_255.4-1ubuntu8.4_amd64.deb",
        sha256 = "daaf40c9ba4c8f11057633040497ef30b28609b516ba1a41a7c63105f993e564",
    )

    # Size: 43870
    http_file(
        name = "libtasn1-6_4.19.0-3build1_amd64",
        urls = ["http://archive.ubuntu.com/ubuntu/pool/main/libt/libtasn1-6/libtasn1-6_4.19.0-3build1_amd64.deb"],
        downloaded_file_path = "libtasn1-6_4.19.0-3build1_amd64.deb",
        sha256 = "e30d8b4b7769966185b5acb40ac81205467022c96d7b1688bf06a3eaded2b98c",
    )

    # Size: 107794
    http_file(
        name = "libtinfo6_6.4~2b.20240113-1ubuntu2_amd64",
        urls = ["http://archive.ubuntu.com/ubuntu/pool/main/n/ncurses/libtinfo6_6.4+20240113-1ubuntu2_amd64.deb"],
        downloaded_file_path = "libtinfo6_6.4+20240113-1ubuntu2_amd64.deb",
        sha256 = "53e1e1753729d04cf65b05e6e58abe06e2bb76cc07eff0e1b2a638a638ca209b",
    )

    # Size: 174852
    http_file(
        name = "libudev1_255.4-1ubuntu8.4_amd64",
        urls = ["http://archive.ubuntu.com/ubuntu/pool/main/s/systemd/libudev1_255.4-1ubuntu8.4_amd64.deb"],
        downloaded_file_path = "libudev1_255.4-1ubuntu8.4_amd64.deb",
        sha256 = "b347b38bb664b71e2a966cc42d495a504936a22e6744acde7e4aa4d025a1018b",
    )

    # Size: 535478
    http_file(
        name = "libunistring5_1.1-2build1_amd64",
        urls = ["http://archive.ubuntu.com/ubuntu/pool/main/libu/libunistring/libunistring5_1.1-2build1_amd64.deb"],
        downloaded_file_path = "libunistring5_1.1-2build1_amd64.deb",
        sha256 = "78acc4c141a499e0c1e4cc47ca8e9082996f3972662c4d92337669ecc9b0a519",
    )

    # Size: 35322
    http_file(
        name = "libuuid1_2.39.3-9ubuntu6.1_amd64",
        urls = ["http://archive.ubuntu.com/ubuntu/pool/main/u/util-linux/libuuid1_2.39.3-9ubuntu6.1_amd64.deb"],
        downloaded_file_path = "libuuid1_2.39.3-9ubuntu6.1_amd64.deb",
        sha256 = "2c47b80575cfbd4164bd5f43df405f8f2a535b5bc82d28b69a0b68ee2bcc927b",
    )

    # Size: 24056
    http_file(
        name = "libxxhash0_0.8.2-2build1_amd64",
        urls = ["http://archive.ubuntu.com/ubuntu/pool/main/x/xxhash/libxxhash0_0.8.2-2build1_amd64.deb"],
        downloaded_file_path = "libxxhash0_0.8.2-2build1_amd64.deb",
        sha256 = "75de256c2d162dfc541beb69a83f025742cd13329262af9059eff3ca42a53239",
    )

    # Size: 299472
    http_file(
        name = "libzstd1_1.5.5~2b.dfsg2-2build1.1_amd64",
        urls = ["http://archive.ubuntu.com/ubuntu/pool/main/libz/libzstd/libzstd1_1.5.5+dfsg2-2build1.1_amd64.deb"],
        downloaded_file_path = "libzstd1_1.5.5+dfsg2-2build1.1_amd64.deb",
        sha256 = "dfcf25061e07aad7efd3f4f880ba5ad4d4d09ebe7fc8cc77ab6b8a161d6d4727",
    )

    # Size: 201680
    http_file(
        name = "login_4.13~2b.dfsg1-4ubuntu3.2_amd64",
        urls = ["http://archive.ubuntu.com/ubuntu/pool/main/s/shadow/login_4.13+dfsg1-4ubuntu3.2_amd64.deb"],
        downloaded_file_path = "login_4.13+dfsg1-4ubuntu3.2_amd64.deb",
        sha256 = "393cb0ed5c12e5a6c0f8e1f0c035fbc5781c19321f43c7d10733c917fb17e01b",
    )

    # Size: 22700
    http_file(
        name = "logsave_1.47.0-2.4~~exp1ubuntu4.1_amd64",
        urls = ["http://archive.ubuntu.com/ubuntu/pool/main/e/e2fsprogs/logsave_1.47.0-2.4~exp1ubuntu4.1_amd64.deb"],
        downloaded_file_path = "logsave_1.47.0-2.4~exp1ubuntu4.1_amd64.deb",
        sha256 = "dba74a557ae28b51b5a5190aefeef611cbf989211b1814282d58a1c536f43b5b",
    )

    # Size: 127222
    http_file(
        name = "mawk_1.3.4.20240123-1build1_amd64",
        urls = ["http://archive.ubuntu.com/ubuntu/pool/main/m/mawk/mawk_1.3.4.20240123-1build1_amd64.deb"],
        downloaded_file_path = "mawk_1.3.4.20240123-1build1_amd64.deb",
        sha256 = "dc7f7f4dad4b48f6012ea65de3198d8376604afef39f06d65ec6167740e203c9",
    )

    # Size: 118188
    http_file(
        name = "mount_2.39.3-9ubuntu6.1_amd64",
        urls = ["http://archive.ubuntu.com/ubuntu/pool/main/u/util-linux/mount_2.39.3-9ubuntu6.1_amd64.deb"],
        downloaded_file_path = "mount_2.39.3-9ubuntu6.1_amd64.deb",
        sha256 = "8557861bca454fe5f5d8d0aeb623ab40b8082fab75205b2ae6f2fad57f14f2ea",
    )

    # Size: 25516
    http_file(
        name = "ncurses-base_6.4~2b.20240113-1ubuntu2_all",
        urls = ["http://archive.ubuntu.com/ubuntu/pool/main/n/ncurses/ncurses-base_6.4+20240113-1ubuntu2_all.deb"],
        downloaded_file_path = "ncurses-base_6.4+20240113-1ubuntu2_all.deb",
        sha256 = "56dbac135d58e580c2c9e33d5fd7c215b48091a54e1d9fa3d41f538f4acbac5f",
    )

    # Size: 188382
    http_file(
        name = "ncurses-bin_6.4~2b.20240113-1ubuntu2_amd64",
        urls = ["http://archive.ubuntu.com/ubuntu/pool/main/n/ncurses/ncurses-bin_6.4+20240113-1ubuntu2_amd64.deb"],
        downloaded_file_path = "ncurses-bin_6.4+20240113-1ubuntu2_amd64.deb",
        sha256 = "1c7641df07311b5797fe1fd7e4e520202e41b38056ad71e22e2022289a6701bb",
    )

    # Size: 844580
    http_file(
        name = "passwd_4.13~2b.dfsg1-4ubuntu3.2_amd64",
        urls = ["http://archive.ubuntu.com/ubuntu/pool/main/s/shadow/passwd_4.13+dfsg1-4ubuntu3.2_amd64.deb"],
        downloaded_file_path = "passwd_4.13+dfsg1-4ubuntu3.2_amd64.deb",
        sha256 = "139b51228c8065eefa3051f649d8480eb986f1cf629448e49d2eaf9813318412",
    )

    # Size: 1822564
    http_file(
        name = "perl-base_5.38.2-3.2build2_amd64",
        urls = ["http://archive.ubuntu.com/ubuntu/pool/main/p/perl/perl-base_5.38.2-3.2build2_amd64.deb"],
        downloaded_file_path = "perl-base_5.38.2-3.2build2_amd64.deb",
        sha256 = "82a75783b5b63b92d83c3f022e98dba9542e30d3a228b3e381d9c302b14df095",
    )

    # Size: 707124
    http_file(
        name = "procps_4.0.4-4ubuntu3.2_amd64",
        urls = ["http://archive.ubuntu.com/ubuntu/pool/main/p/procps/procps_4.0.4-4ubuntu3.2_amd64.deb"],
        downloaded_file_path = "procps_4.0.4-4ubuntu3.2_amd64.deb",
        sha256 = "73166776dc49e148f5c05813171fbc5db5703e7a1e981329b63bd201abc10f42",
    )

    # Size: 56484
    http_file(
        name = "readline-common_8.2-4build1_all",
        urls = ["http://archive.ubuntu.com/ubuntu/pool/main/r/readline/readline-common_8.2-4build1_all.deb"],
        downloaded_file_path = "readline-common_8.2-4build1_all.deb",
        sha256 = "879bfd7f8a9bc4c0f7cdc777cdd8bc6de5f8c4a2ac80c060322a1b22f13504bb",
    )

    # Size: 193410
    http_file(
        name = "sed_4.9-2build1_amd64",
        urls = ["http://archive.ubuntu.com/ubuntu/pool/main/s/sed/sed_4.9-2build1_amd64.deb"],
        downloaded_file_path = "sed_4.9-2build1_amd64.deb",
        sha256 = "a09b856849cf36190f8cd39da33486b14bcaf81b592530b2f3236da17daaad2f",
    )

    # Size: 22462
    http_file(
        name = "sensible-utils_0.0.22_all",
        urls = ["http://archive.ubuntu.com/ubuntu/pool/main/s/sensible-utils/sensible-utils_0.0.22_all.deb"],
        downloaded_file_path = "sensible-utils_0.0.22_all.deb",
        sha256 = "410c29ff82c6916d14e235b511287e67a45cb78d509b19aab48608acdc941254",
    )

    # Size: 34170
    http_file(
        name = "sysvinit-utils_3.08-6ubuntu3_amd64",
        urls = ["http://archive.ubuntu.com/ubuntu/pool/main/s/sysvinit/sysvinit-utils_3.08-6ubuntu3_amd64.deb"],
        downloaded_file_path = "sysvinit-utils_3.08-6ubuntu3_amd64.deb",
        sha256 = "03cf5c9c28a5d186fb7f5214e464f831ff28177695cbb61e66083237267a047e",
    )

    # Size: 253398
    http_file(
        name = "tar_1.35~2b.dfsg-3build1_amd64",
        urls = ["http://archive.ubuntu.com/ubuntu/pool/main/t/tar/tar_1.35+dfsg-3build1_amd64.deb"],
        downloaded_file_path = "tar_1.35+dfsg-3build1_amd64.deb",
        sha256 = "015b65ef176021c1846ec8b6152167d5d266c1949ec30ee3367e95fa2b2ead27",
    )

    # Size: 11124
    http_file(
        name = "ubuntu-keyring_2023.11.28.1_all",
        urls = ["http://archive.ubuntu.com/ubuntu/pool/main/u/ubuntu-keyring/ubuntu-keyring_2023.11.28.1_all.deb"],
        downloaded_file_path = "ubuntu-keyring_2023.11.28.1_all.deb",
        sha256 = "36de43b15853ccae0028e9a767613770c704833f82586f28eb262f0311adb8a8",
    )

    # Size: 1127370
    http_file(
        name = "util-linux_2.39.3-9ubuntu6.1_amd64",
        urls = ["http://archive.ubuntu.com/ubuntu/pool/main/u/util-linux/util-linux_2.39.3-9ubuntu6.1_amd64.deb"],
        downloaded_file_path = "util-linux_2.39.3-9ubuntu6.1_amd64.deb",
        sha256 = "18b52799c6fb876c5ab6cd63056894254583a7f28a676d6ab390adedd14c06db",
    )

    # Size: 62850
    http_file(
        name = "zlib1g_1.3.dfsg-3.1ubuntu2.1_amd64",
        urls = ["http://archive.ubuntu.com/ubuntu/pool/main/z/zlib/zlib1g_1.3.dfsg-3.1ubuntu2.1_amd64.deb"],
        downloaded_file_path = "zlib1g_1.3.dfsg-3.1ubuntu2.1_amd64.deb",
        sha256 = "7074b6a2f6367a10d280c00a1cb02e74277709180bab4f2491a2f355ab2d6c20",
    )

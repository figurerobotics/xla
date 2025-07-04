# Copyright 2023 Figure AI, Inc

licenses(["restricted"])  # NVIDIA proprietary license

load("@rules_cc//cc:defs.bzl", "cc_library")

package(default_visibility = ["//visibility:public"])

cc_library(
    name = "nvjpeg",
    srcs = ["lib/libnvjpeg.so"],
    hdrs = glob(["include/**"]),
    includes = ["include"],
    deps = ["@local_config_cuda//cuda:cudart"],
    visibility = ["//visibility:public"],
)

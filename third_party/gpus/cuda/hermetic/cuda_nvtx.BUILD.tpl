licenses(["restricted"])  # NVIDIA proprietary license

cc_library(
    name = "headers",
    srcs = ["lib/libnvToolsExt.so.%{libnvtoolsext_version}"],
    %{comment}hdrs = glob([
        %{comment}"include/nvToolsExt*.h",
        %{comment}"include/nvtx3/**",
    %{comment}]),
    #include_prefix = "third_party/gpus/cuda/include",
    includes = ["include"],
    #strip_include_prefix = "include",
    visibility = ["@local_config_cuda//cuda:__pkg__"],
)

cc_library(
    name = "nvtx",
    srcs = ["lib/libnvToolsExt.so"],
    deps = [":headers"],
    includes = ["include"],
    visibility = ["@local_config_cuda//cuda:__pkg__"],
)

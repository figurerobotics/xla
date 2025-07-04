# Copyright 2025 Figure AI, Inc

load("@bazel_skylib//lib:modules.bzl", "modules")
load("@xla//third_party/gpus/cuda/hermetic:cuda_configure.bzl", "cuda_configure")

def _hermetic_cuda_impl(module_ctx):
    cuda_configure(name = "local_config_cuda")
    return modules.use_all_repos(module_ctx)

hermetic_cuda = module_extension(_hermetic_cuda_impl)

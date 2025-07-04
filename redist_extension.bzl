# Copyright 2025 Figure AI, Inc

load("@bazel_skylib//lib:modules.bzl", "modules")
load("@cuda_redist_json//:distributions.bzl", "CUDA_REDISTRIBUTIONS", "CUDNN_REDISTRIBUTIONS")
load("@xla//third_party/gpus/cuda/hermetic:cuda_redist_init_repositories.bzl", "cuda_redist_init_repositories", "cudnn_redist_init_repository")

def _cuda_redist_impl(module_ctx):
    cuda_redist_init_repositories(
        cuda_redistributions = CUDA_REDISTRIBUTIONS,
    )

    cudnn_redist_init_repository(
        cudnn_redistributions = CUDNN_REDISTRIBUTIONS,
    )

    #return module_ctx.extension_metadata()
    return modules.use_all_repos(module_ctx)

redist_config = module_extension(_cuda_redist_impl)

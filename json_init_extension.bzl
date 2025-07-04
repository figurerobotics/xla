# Copyright 2025 Figure AI, Inc

load("@xla//third_party/gpus/cuda/hermetic:cuda_json_init_repository.bzl", "cuda_json_init_repository")

def _json_init_impl(module_ctx):
    cuda_json_init_repository()
    return module_ctx.extension_metadata(root_module_direct_deps = ["cuda_redist_json"], root_module_direct_dev_deps = [])

json_init = module_extension(
    implementation = _json_init_impl,
)

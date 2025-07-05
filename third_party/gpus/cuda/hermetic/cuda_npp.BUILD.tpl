# Copyright 2025 Figure AI, Inc

package(default_visibility = ["//visibility:public"])

_NPP_LIBS = {
    "nppc": [
        "npp.h",
        "nppcore.h",
        "nppdefs.h",
    ],
    "nppial": ["nppi_arithmetic_and_logical_operations.h"],
    "nppicc": ["nppi_color_conversion.h"],
    "nppidei": ["nppi_data_exchange_and_initialization.h"],
    "nppif": ["nppi_filtering_functions.h"],
    "nppig": ["nppi_geometry_transforms.h"],
    "nppim": ["nppi_morphological_operations.h"],
    "nppist": [
        "nppi_statistics_functions.h",
        "nppi_linear_transforms.h",
    ],
    "nppisu": ["nppi_support_functions.h"],
    "nppitc": ["nppi_threshold_and_compare_operations.h"],
    "npps": [
        "npps_arithmetic_and_logical_operations.h",
        "npps_conversion_functions.h",
        "npps_filtering_functions.h",
        "npps.h",
        "npps_initialization.h",
        "npps_statistics_functions.h",
        "npps_support_functions.h",
    ],
}

_NPP_LIBS_VERSIONS = {
    "nppc": "%{libnppc_version}",
    "nppial": "%{libnppial_version}",
    "nppicc": "%{libnppicc_version}",
    "nppidei": "%{libnppidei_version}",
    "nppif": "%{libnppif_version}",
    "nppig": "%{libnppig_version}",
    "nppim": "%{libnppim_version}",
    "nppist": "%{libnppist_version}",
    "nppisu": "%{libnppisu_version}",
    "nppitc": "%{libnppitc_version}",
    "npps": "%{libnpps_version}",
}

[
    cc_import(
        name = name + "_so",
        shared_library = "lib/lib{}.so.{}".format(name, _NPP_LIBS_VERSIONS[name]),
    )
    for name in _NPP_LIBS.keys()
]

[
    cc_library(
        name = name,
        hdrs = ["include/" + hdr for hdr in hdrs],
        includes = ["include"],
        visibility = ["//visibility:public"],
        deps = ([":nppc"] if name != "nppc" else []) + [
            ":{}_so".format(name),
        ],
    )
    for name, hdrs in _NPP_LIBS.items()
]

cc_library(
    name = "nppi",
    hdrs = ["include/nppi.h"],
    deps = [
        ":nppial",
        ":nppicc",
        ":nppidei",
        ":nppif",
        ":nppig",
        ":nppim",
        ":nppist",
        ":nppisu",
        ":nppitc",
    ],
)

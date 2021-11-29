exports_files(
    ["src/lpi/lpi_glop.cpp"],
)

config_setting(
    name = "on_linux",
    constraint_values = [
        "@platforms//os:linux",
    ],
)

config_setting(
    name = "on_macos",
    constraint_values = [
        "@platforms//os:macos",
    ],
)

config_setting(
    name = "on_windows",
    constraint_values = [
        "@platforms//os:windows",
    ],
)

PLATFORM_FLAGS = select({
    "on_linux": [
        "-Wunknown-pragmas",
        "-fexceptions",
        "-DSYM=bliss"
    ],
    "on_macos": [
        "-Wunknown-pragmas",
        "-fexceptions",
        "-DSYM=bliss"
    ],
    "on_windows": [
        "/DSYM=none",
        "/DSCIP_NO_SIGACTION"
        ],
    "//conditions:default": [],
})

PLATFORM_DEPS = select({
    "on_linux": ["@bliss//:libbliss"],
    "on_macos": ["@bliss//:libbliss"],
    "on_windows": ["@zlib//:zlib"],
    "//conditions:default": [],
})

BLISS_FILE = select({
    "on_linux": ["src/symmetry/compute_symmetry_bliss.cpp"],
    "on_macos": ["src/symmetry/compute_symmetry_bliss.cpp"],
    "on_windows": ["src/symmetry/compute_symmetry_none.cpp"],
    "//conditions:default": ["src/symmetry/compute_symmetry_none.cpp"],
})

cc_library(
    name = "libscip",
    srcs = glob(
        [
            "src/*/*.c",
        ],
        exclude = [
            "src/lpi/lpi_*.c",
            "src/nlpi/exprinterpret_*.c",
            "src/nlpi/nlpi_filtersqp.c",
            "src/nlpi/nlpi_worhp.c",
            "src/scip/compr_xyz.c",
            "src/scip/sorttpl.c",
            "src/symmetry/compute_symmetry_*.cpp",
            "src/tpi/tpi_*.c",
        ],
    ) + BLISS_FILE + [
        "src/nlpi/exprinterpret_none.c",
        "src/tpi/tpi_tnycthrd.c",
    ],
    hdrs = glob(
        [
            "src/*/*.h",
            "src/*/*.hpp",
            "src/scip/githash.c",
            "src/scip/sorttpl.c",
            "src/scip/buildflags.c",
        ],
        exclude =
        [
            #"src/scip/prop_symmetry.h",
        ]),
        copts = [
        "$(STACK_FRAME_UNLIMITED)",  # src/scip/reader_cnf.c
        "-DSCIP_WITH_ZLIB",
        "-DWITH_SCIPDEF",
        "-DSCIP_ROUNDING_FE",
        "-DTPI_TNYC",  # src/tpi/type_tpi_tnycthrd.h
        # Compile in thead-safe mode (required since we use TPI_TNYC). Note,
        # one does not technically need to add this, as SCIP code always
        # uses syntax like "#ifndef NPARASCIP". But let's be explicit here.
        "-DPARASCIP",
        "-Isrc",
        "-Isrc/scip",
    ] + PLATFORM_FLAGS,
    defines = [
        # Scip 7.0.1 optionally depends on scip/config.h and
        # scip/scip_export.h that are generated by build system.
        #
        # We need every library and binary that depends on SCIP libraries to
        # define this macro. That is why we use `defines' here instead of
        # `copts' or `local_defines'.
        "NO_CONFIG_HEADER",
    ],
    features = ["-parse_headers"],
    includes = [
        "src",
    ],
    visibility = ["//visibility:public"],
    deps = [
        #"@cppad:cppad_includes",
    ] + PLATFORM_DEPS,
)

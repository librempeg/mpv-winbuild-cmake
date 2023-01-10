ExternalProject_Add(libvpl
    GIT_REPOSITORY https://github.com/oneapi-src/oneVPL.git
    SOURCE_DIR ${SOURCE_LOCATION}
    GIT_SHALLOW 1
    UPDATE_COMMAND ""
    CONFIGURE_COMMAND ${EXEC} cmake -H<SOURCE_DIR> -B<BINARY_DIR>
            -G Ninja
            -DCMAKE_INSTALL_PREFIX=${MINGW_INSTALL_PREFIX}
            -DCMAKE_TOOLCHAIN_FILE=${TOOLCHAIN_FILE}
            -DCMAKE_BUILD_TYPE=Release
            -DBUILD_DISPATCHER=ON
            -DBUILD_DEV=ON 
            -DBUILD_PREVIEW=OFF
            -DBUILD_TOOLS=OFF
            -DBUILD_TOOLS_ONEVPL_EXPERIMENTAL=OFF
            -DINSTALL_EXAMPLE_CODE=OFF
            -DBUILD_SHARED_LIBS=OFF
            -DBUILD_TESTS=OFF

    BUILD_COMMAND ninja -C <BINARY_DIR>
    INSTALL_COMMAND ninja -C <BINARY_DIR> install
    LOG_DOWNLOAD 1 LOG_UPDATE 1 LOG_CONFIGURE 1 LOG_BUILD 1 LOG_INSTALL 1
)

force_rebuild_git(libvpl)
#autoreconf(libvpl)
cleanup(libvpl install)

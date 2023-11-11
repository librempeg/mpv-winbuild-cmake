ExternalProject_Add(aom
    GIT_REPOSITORY https://aomedia.googlesource.com/aom
    SOURCE_DIR ${SOURCE_LOCATION}
    GIT_CLONE_FLAGS "--filter=tree:0"
    GIT_REMOTE_NAME origin
    GIT_TAG main
    UPDATE_COMMAND ""
    CONFIGURE_COMMAND ${EXEC} cmake -H<SOURCE_DIR> -B<BINARY_DIR>
        -G Ninja
        -DCMAKE_INSTALL_PREFIX=${MINGW_INSTALL_PREFIX}
        -DCMAKE_FIND_ROOT_PATH=${CMAKE_INSTALL_PREFIX}
        -DCMAKE_TOOLCHAIN_FILE=<SOURCE_DIR>/build/cmake/toolchains/${TARGET_CPU_FAMILY}-mingw-gcc.cmake
        -DBUILD_SHARED_LIBS=OFF
        -DENABLE_EXAMPLES=OFF
        -DENABLE_DOCS=OFF
        -DENABLE_TOOLS=OFF
        -DENABLE_NASM=ON
        -DENABLE_TESTS=OFF
        -DENABLE_TESTDATA=OFF
        -DCONFIG_UNIT_TESTS=0
        -DCONFIG_AV1_DECODER=0
        -DCMAKE_BUILD_TYPE=Release
    BUILD_COMMAND ${EXEC} ninja -C <BINARY_DIR>
    INSTALL_COMMAND ${EXEC} ninja -C <BINARY_DIR> install
    LOG_DOWNLOAD 1 LOG_UPDATE 1 LOG_CONFIGURE 1 LOG_BUILD 1 LOG_INSTALL 1
)

force_rebuild_git(aom)
cleanup(aom install)

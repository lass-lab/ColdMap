# ZenFS plugin integration for MyRocks/RocksDB build
# ---------------------------------------------------
# Usage:
#   1. Save this file as cmake/zenfs_plugin.cmake (or any path you like).
#   2. In your top‐level CMakeLists.txt **after** the call that creates
#      the `rocksdblib` target (ADD_CONVENIENCE_LIBRARY or add_library),
#      simply add:
#
#         include(cmake/zenfs_plugin.cmake)
#
#   3. Make sure libzbd (zone block‑device helper) is findable by the
#      linker (e.g., `apt install libzbd-dev` or custom path via
#      `-DZBD_LIBRARY=...`).
# ---------------------------------------------------

# 1. Add ZenFS source files to the RocksDB library target
set(ZENFS_SOURCES
    ${ROCKSDB_SOURCE_DIR}/plugin/zenfs/fs/fs_zenfs.cc
    ${ROCKSDB_SOURCE_DIR}/plugin/zenfs/fs/io_zenfs.cc
    ${ROCKSDB_SOURCE_DIR}/plugin/zenfs/fs/zbd_zenfs.cc
    ${ROCKSDB_SOURCE_DIR}/plugin/zenfs/fs/zbdlib_zenfs.cc
    ${ROCKSDB_SOURCE_DIR}/plugin/zenfs/fs/zonefs_zenfs.cc)

target_sources(rocksdblib PRIVATE ${ZENFS_SOURCES})

# 2. Tell RocksDB we are building the 'zenfs' plugin
add_definitions(-DROCKSDB_PLUGIN=zenfs)

# 3. Link against libzbd (plain signature to avoid CMake signature mix error)
#    (The main build already used the plain signature.)
target_link_libraries(rocksdblib zbd)

# 4. Force-reference the registration symbol so the linker keeps it
if(APPLE)
    target_link_options(rocksdblib INTERFACE "-Wl,-u,_zenfs_filesystem_reg")
else()
    target_link_options(rocksdblib INTERFACE "-Wl,-u,zenfs_filesystem_reg")
endif()

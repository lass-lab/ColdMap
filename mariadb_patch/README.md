## Copy paste the file to following paths:

ha_rocksdb.cc --> mariadb-10.2/storage/rocksdb/ha_rocksdb.cc

build_zenfs.cmake --> mariadb-10.2/storage/rocksdb/build_zenfs.cmake 

build_rocksdb.cmake --> mariadb-10.2/storage/rocksdb/build_rocksdb.cmake 

db.h --> mariadb-10.2/storage/rocksdb/rocksdb/include/db.h


## how to compile:
```
git clone https://github.com/MariaDB/server.git mariadb-10.2
cd mariadb-10.2
git checkout 10.2
git submodule init
git submodule update
cmake .  -DUPDATE_SUBMODULES=OFF \
        -DROCKSDB_SOURCE_DIR=/home/minsky/EZC/rocksdb
```

Note : You need to copy paste ColdMap' source code to mariadb-10.2/storage/rocksdb/rocksdb. if not, it will add posix rocksdb, not rocksdb-zns
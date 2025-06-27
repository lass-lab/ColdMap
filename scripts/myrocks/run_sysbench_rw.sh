mysql -S /tmp/mysql.sock -u root -e "CREATE DATABASE IF NOT EXISTS sbtest;"

# we preload and set more threads to simulate stressed environment.

sysbench \
  --db-driver=mysql \
  --mysql-socket=/tmp/mysql.sock \
  --mysql-port=3307 \
  --mysql-user=root \
  --mysql-db=sbtest \
  --tables=8 \
  --table-size=40000000 \
  --threads=128 \
  --time=10800 \
  --mysql_storage_engine="rocksdb" \
  oltp_read_write prepare > db_result2_fegc

sysbench \
  --db-driver=mysql \
  --mysql-socket=/tmp/mysql.sock \
  --mysql-port=3307 \
  --mysql-user=root \
  --mysql-db=sbtest \
  --tables=8 \
  --table-size=50000000 \
  --threads=128 \
  --time=2000 \
  --mysql_storage_engine="rocksdb" \
  --rand-type=uniform \
  oltp_read_write run >> db_result2_fegc

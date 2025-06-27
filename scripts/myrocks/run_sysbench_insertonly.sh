mysql -S /tmp/mysql.sock -u root -e "CREATE DATABASE IF NOT EXISTS sbtest;"

sysbench \
  --db-driver=mysql \
  --mysql-socket=/tmp/mysql.sock \
  --mysql-port=3307 \
  --mysql-user=root \
  --mysql-db=sbtest \
  --tables=4 \
  --table-size=30000000 \
  --threads=16 \
  --time=3600 \
  oltp_insert run
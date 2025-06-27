mysqladmin -u root -p shutdown
# mkfs zenfs
sleep 2
rm -rf /home/minsky/EZC/log_
mkdir -p /home/minsky/EZC/log_

echo "mq-deadline" | sudo tee /sys/block/nvme1n2/queue/scheduler >asdf


sudo nvme zns reset-zone /dev/nvme1n2 -a


sudo /home/minsky/EZC/rocksdb/plugin/zenfs/util/zenfs mkfs --force --enable_gc \
                --zbd=/nvme1n2 --aux_path=/home/minsky/EZC/log_  > asdf


# init mariadb
sudo rm -rf /home/minsky/mariadb-10.2/mysql-test/var
(cd mysql-test; ./mtr alias)
cp -r /home/minsky/mariadb-10.2/mysql-test/var/install.db ~/data1

# mount mariadb
/home/minsky/mariadb-10.2/sql/mysqld --defaults-file=/home/minsky/cbsc.cnf # .cnf is option file.

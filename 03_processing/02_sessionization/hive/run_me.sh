#!/bin/bash -x

sudo -u hdfs hadoop fs -mkdir -p /data/bikeshop/clickstream
sudo -u hdfs hadoop fs -chmod 1777 /data/bikeshop/clickstream

sudo -u hdfs hadoop fs -mkdir -p /user/$USER
sudo -u hdfs hadoop fs -chown $USER:$USER /user/$USER

hive -f 01-create-raw-log-table.hql
hive -f 02-create-parquet-log-table.hql
hive -f 03-populate-parquet-log-table.hql
hive -f 04-query-parquet-log-table.hql


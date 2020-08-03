#! /bin/bash

export SPARK_PRINT_LAUNCH_COMMAND=1

pyspark --master yarn \
 --jars /usr/hdp/current/hive_warehouse_connector/hive-warehouse-connector-assembly-1.0.0.3.1.5.0-152.jar --py-files /usr/hdp/current/hive_warehouse_connector/pyspark_hwc-1.0.0.3.1.5.0-152.zip \
 --conf spark.security.credentials.hiveserver2.enabled=false \
 --conf spark.sql.hive.hiveserver2.jdbc.url="jdbc:hive2://lxdsydstl-lxm02-s01-mhm20001.s01.oan:2181,lxdsydstl-lxm03-s01-mhm30001.s01.oan:2181,lxdsydstl-lxm04-s01-mhm40001.s01.oan:2181/;serviceDiscoveryMode=zooKeeper;zooKeeperNamespace=hiveserver2-interactive" \
 --conf spark.hadoop.hive.llap.daemon.service.hosts=@llap0 \
 --conf spark.datasource.hive.warehouse.load.staging.dir=/tmp \
 --conf spark.datasource.hive.warehouse.metastoreUri=thrift://lxdsydstl-lxm02-s01-mhm20001.s01.oan:9083 \
 --conf spark.sql.hive.hiveserver2.jdbc.url.principal=hive/_HOST@S01.OAN \
 --conf spark.hadoop.hive.zookeeper.quorum=lxdsydstl-lxm02-s01-mhm20001.s01.oan:2181,lxdsydstl-lxm03-s01-mhm30001.s01.oan:2181,lxdsydstl-lxm04-s01-mhm40001.s01.oan:2181





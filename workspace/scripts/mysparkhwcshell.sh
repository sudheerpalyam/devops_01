#! /bin/bash

export SPARK_PRINT_LAUNCH_COMMAND=1
export SPARK_MAJOR_VERSION=2

# libdir=/home/d917355/workspace/lib
# spark-shell --deploy-mode client --master yarn --executor-cores 4 --executor-memory 12g --jars  /usr/share/aws/redshift/jdbc/RedshiftJDBC41.jar,/home/sudheerpalyam/myspace/deploy/jars/spark-redshift_2.11-2.0.0.jar,/home/sudheerpalyam/myspace/deploy/jars/spark-avro_2.11-4.0.0.jar,/home/sudheerpalyam/myspace/deploy/jars/minimal-json-0.9.4.jar,/home/sudheerpalyam/myspace/tools/jars/postgresql-42.1.4.jar
# --master yarn --driver-memory 8G --executor-cores 4 --executor-memory 8g --num-executors 6 --jars $(echo $libdir/*.jar | tr ' ' ',') --driver-class-path $(echo $libdir/*.jar | tr ' ' ',')


# --conf spark.sql.hive.hiveserver2.jdbc.url="jdbc:hive2://lxdsydstl-lxm02-s01-mhm20001.s01.oan:2181,lxdsydstl-lxm03-s01-mhm30001.s01.oan:2181,lxdsydstl-lxm04-s01-mhm40001.s01.oan:2181/;serviceDiscoveryMode=zooKeeper;zooKeeperNamespace=hiveserver2" \
# --conf spark.datasource.hive.warehouse.metastoreUri=thrift://lxdsydstl-lxm02-s01-mhm20001.s01.oan:9083 \
# --deploy-mode client  \


spark-shell  --conf spark.ui.port=4123 \
--deploy-mode client \
--master yarn --driver-memory 8G --executor-cores 4 --executor-memory 8g --num-executors 2 \
--jars /usr/hdp/current/hive_warehouse_connector/hive-warehouse-connector-assembly-1.0.0.3.1.5.0-152.jar \
--conf spark.security.credentials.hiveserver2.enabled=true \
--conf spark.sql.hive.hiveserver2.jdbc.url="jdbc:hive2://lxdsydstl-lxm02-s01-mhm20001.s01.oan:2181,lxdsydstl-lxm03-s01-mhm30001.s01.oan:2181,lxdsydstl-lxm04-s01-mhm40001.s01.oan:2181/;serviceDiscoveryMode=zooKeeper;zooKeeperNamespace=hiveserver2-interactive" \
--conf spark.hadoop.hive.llap.daemon.service.hosts=@llap0 \
--conf spark.datasource.hive.warehouse.load.staging.dir=/tmp \
--conf spark.datasource.hive.warehouse.metastoreUri=thrift://lxdsydstl-lxm01-s01-mhm10001.s01.oan:9083,thrift://lxdsydstl-lxm02-s01-mhm20001.s01.oan:9083 \
--conf spark.sql.hive.hiveserver2.jdbc.url.principal=hive/_HOST@S01.OAN \
--conf spark.hadoop.hive.zookeeper.quorum=lxdsydstl-lxm02-s01-mhm20001.s01.oan:2181,lxdsydstl-lxm03-s01-mhm30001.s01.oan:2181,lxdsydstl-lxm04-s01-mhm40001.s01.oan:2181





#! /bin/bash

runTime=`date '+%Y%m%d-%H%M%S'`
echo "Script trigerred at $runTime"
logFile="logs/sample-$runTime.log"
jarFile="/home/d917355/workspace/spark/sampleworkcount/sparkwordcount-0.0.1-SNAPSHOT.jar"
dataFile="/user/d917355/oozieapps/ooziesparkpi/coordinator.xml"
echo "Application jar file:  $jarFile"

# --class com.cloudera.sparkwordcount.SimpleApp \
nohup spark-submit \
 --deploy-mode cluster --master yarn \
 --name samplehive-manual-run \
 --executor-memory 4G --conf spark.yarn.executor.memoryOverhead=4G --conf spark.yarn.driver.memoryOverhead=4G  \
 --executor-cores 4 --num-executors 1 \
 --conf "spark.executor.extraJavaOptions=-XX:+UseG1GC" \
 --conf spark.ui.port=4123 \
 --jars /usr/hdp/current/hive_warehouse_connector/hive-warehouse-connector-assembly-1.0.0.3.1.5.0-152.jar \
 --conf spark.security.credentials.hiveserver2.enabled=true \
 --conf spark.sql.hive.hiveserver2.jdbc.url="jdbc:hive2://lxdsydstl-lxm02-s01-mhm20001.s01.oan:2181,lxdsydstl-lxm03-s01-mhm30001.s01.oan:2181,lxdsydstl-lxm04-s01-mhm40001.s01.oan:2181/;serviceDiscoveryMode=zooKeeper;zooKeeperNamespace=hiveserver2-interactive" \
 --conf spark.hadoop.hive.llap.daemon.service.hosts=@llap0 \
 --conf spark.datasource.hive.warehouse.load.staging.dir=/tmp \
 --conf spark.datasource.hive.warehouse.metastoreUri=thrift://lxdsydstl-lxm01-s01-mhm10001.s01.oan:9083,thrift://lxdsydstl-lxm02-s01-mhm20001.s01.oan:9083 \
 --conf spark.sql.hive.hiveserver2.jdbc.url.principal=hive/_HOST@S01.OAN \
 --conf spark.hadoop.hive.zookeeper.quorum=lxdsydstl-lxm02-s01-mhm20001.s01.oan:2181,lxdsydstl-lxm03-s01-mhm30001.s01.oan:2181,lxdsydstl-lxm04-s01-mhm40001.s01.oan:2181 \
 --files log4j.properties --conf "spark.driver.extraJavaOptions=-Dlog4j.configuration=file:log4j.properties" \
 --conf "spark.executor.extraJavaOptions=-Dlog4j.configuration=file:log4j.properties" \
 --class com.cloudera.sparkwordcount.SimpleHiveApp \
 $jarFile \
 $dataFile \
  >> $logFile &

echo "Log file: $logFile "
echo "Script finished at " `date '+%Y%m%d-%H%M%S'`


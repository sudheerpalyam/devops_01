#! /bin/bash

runTime=`date '+%Y%m%d-%H%M%S'`
echo "Script trigerred at $runTime"
logFile="../logs/nem-$runTime.log"
jarFile="/home/d917355/workspace/oozie/oanapps/nem/oozie/spark/dataprep/curation/datacuration.jar"
#jarFile="../jars/data-curation-athenian-20190801-132418.jar"
#jarFile="../jars/archive/datacuration_without_repartionandcache.jar"
echo "Application jar file:  $jarFile"
export  SPARK_MAJOR_VERSION=2
set  SPARK_MAJOR_VERSION=2

nohup spark-submit \
 --deploy-mode client --master yarn \
 --name nem-manual-run \
 --executor-memory 4G --conf spark.yarn.executor.memoryOverhead=4G --conf spark.yarn.driver.memoryOverhead=4G  \
 --executor-cores 4 --num-executors 1 \
 --conf "spark.executor.extraJavaOptions=-XX:+UseG1GC" \
 --conf spark.ui.port=4123 \
 --jars $(echo ../lib/*.jar | tr ' ' ',')  \
 --class au.com.telstra.in.oan.dataCuration.driver \
 --files log4j.properties --conf "spark.driver.extraJavaOptions=-Dlog4j.configuration=file:log4j.properties" \
 --conf "spark.executor.extraJavaOptions=-Dlog4j.configuration=file:log4j.properties" \
 $jarFile \
 /oanapps/nem/oozie/spark/distributed-cache/file/sp_dp_i_nem_device_bdcx_nonsp.properties " "  current \
  >> $logFile &

echo "Log file: $logFile "
echo "Script finished at " `date '+%Y%m%d-%H%M%S'`


 # --files log4j.properties --conf "spark.driver.extraJavaOptions=-Dlog4j.configuration=file:log4j.properties" \
 # --conf "spark.executor.extraJavaOptions=-Dlog4j.configuration=file:log4j.properties" \
 # ../jars/data-curation-athenian-20190801-111430.jar \
# <arg>/oanapps/nem/oozie/spark/distributed-cache/file/sp_dp_i_nem_device_bdcx_nonsp.properties</arg>

 #  <arg>src_date=2020-03-12</arg>

  # <arg>processing/202003082300</arg>

 #  <arg>priorityRating=medium</arg>

 #  <arg>Workflow Id=0000074-200312060405559-oozie-oozi-W</arg>

  # <arg>Workflow Name=wf_curation_nem_device_bdcx</arg>

  # <arg>Error Node=iSpark2_curate_files</arg>

  # <arg>User Id=d917355</arg>


#! /bin/bash

runTime=`date '+%Y%m%d-%H%M%S'`
echo "Script trigerred at $runTime"
logFile="../logs/athenian-$runTime.log"
jarFile="../jars/data-curation-athenian-20190801-132418.jar"
#jarFile="../jars/archive/datacuration_without_repartionandcache.jar"
echo "Application jar file:  $jarFile"
export  SPARK_MAJOR_VERSION=2
set  SPARK_MAJOR_VERSION=2

nohup spark-submit \
 --deploy-mode client --master yarn \
 --name athenian-manual-run \
 --executor-memory 4G --conf spark.yarn.executor.memoryOverhead=4G --conf spark.yarn.driver.memoryOverhead=4G  \
 --executor-cores 4 --num-executors 1 \
 --conf "spark.executor.extraJavaOptions=-XX:+UseG1GC" \
 --conf spark.ui.port=4123 \
 --jars $(echo ../lib/*.jar | tr ' ' ',')  \
 --class au.com.telstra.in.oan.dataCuration.driver \
 $jarFile \
 /user/d917355/jobs/sp_dp_i_athenian_ua_offerhistattrib.properties " " current \
 --mode  yarn >> $logFile &

echo "Log file: $logFile "
echo "Script finished at " `date '+%Y%m%d-%H%M%S'`


 # --files log4j.properties --conf "spark.driver.extraJavaOptions=-Dlog4j.configuration=file:log4j.properties" \
 # --conf "spark.executor.extraJavaOptions=-Dlog4j.configuration=file:log4j.properties" \
 # ../jars/data-curation-athenian-20190801-111430.jar \

#! /bin/bash

runTime=`date '+%Y%m%d-%H%M%S'`
echo "Script trigerred at $runTime"
logFile="../logs/mysparksubmit-$runTime.log"
export  SPARK_MAJOR_VERSION=2
set  SPARK_MAJOR_VERSION=2

nohup spark-submit \
 --deploy-mode client --master yarn \
 --name nem-manual-run \
 --executor-memory 16g --conf spark.yarn.executor.memoryOverhead=4G --conf spark.yarn.driver.memoryOverhead=4G  \
 --executor-cores 4 --num-executors 10 \
 --conf "spark.executor.extraJavaOptions=-XX:+UseG1GC" \
 --jars $(echo ../lib/*.jar | tr ' ' ',')  \
 --class au.com.telstra.in.oan.dataCuration.driver \
 ../jars/datacuration.jar \
 /user/d917355/jobs/nem/sp_dp_i_nem_device_bdcx_nonsp.properties " " current \
 --mode  yarn >> $logFile &

echo "Log file: $logFile "
echo "Script finished at " `date '+%Y%m%d-%H%M%S'`


 # --files log4j.properties --conf "spark.driver.extraJavaOptions=-Dlog4j.configuration=file:log4j.properties" \
 # --conf "spark.executor.extraJavaOptions=-Dlog4j.configuration=file:log4j.properties" \

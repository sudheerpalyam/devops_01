#! /bin/bash

runTime=`date '+%Y%m%d-%H%M%S'`
echo "Script trigerred at $runTime"
logFile="../logs/siiam-rdbms-ingest-$runTime.log"
# jarFile="../jars/data-ingestion-rdbms-siiam-20190812-003706.jar"
jarFile="../jars/ingestion-app-0.1.jar"
echo "Application jar file:  $jarFile"
export  SPARK_MAJOR_VERSION=2
set  SPARK_MAJOR_VERSION=2

nohup spark-submit \
 --deploy-mode cluster --master yarn \
 --name siiam-rdbms-manual-run \
 --executor-memory 4G --conf spark.yarn.executor.memoryOverhead=4G --conf spark.yarn.driver.memoryOverhead=4G  \
 --executor-cores 4 --num-executors 1 \
 --conf "spark.executor.extraJavaOptions=-XX:+UseG1GC" \
 --conf spark.ui.port=4123 \
 --conf "spark.yarn.maxAppAttempts=1" \
 --jars $(echo ../lib/*.jar | tr ' ' ',')  \
 --class au.com.telstra.in.oan.dataIngestion.sample.DirectSQLQuery \
 $jarFile \
 /user/d917355/jobs/sp_dp_i_siiam_act_entry.properties " " " " \
 >> $logFile &

echo "Log file: $logFile "
echo "Script finished at " `date '+%Y%m%d-%H%M%S'`


 # --class au.com.telstra.in.oan.dataIngestion.driver \
 # --files log4j.properties --conf "spark.driver.extraJavaOptions=-Dlog4j.configuration=file:log4j.properties" \
 # --conf "spark.executor.extraJavaOptions=-Dlog4j.configuration=file:log4j.properties" \
 # ../jars/data-curation-athenian-20190801-111430.jar \

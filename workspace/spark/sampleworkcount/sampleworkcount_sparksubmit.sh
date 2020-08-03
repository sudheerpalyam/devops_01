#! /bin/bash

runTime=`date '+%Y%m%d-%H%M%S'`
echo "Script trigerred at $runTime"
logFile="logs/sample-$runTime.log"
jarFile="/home/d917355/workspace/spark/sampleworkcount/sparkwordcount-0.0.1-SNAPSHOT.jar"
dataFile="/user/d917355/oozieapps/ooziesparkpi/coordinator.xml"
echo "Application jar file:  $jarFile"

# --class com.cloudera.sparkwordcount.SimpleApp \
nohup spark-submit \
 --deploy-mode client --master yarn \
 --name sampleworkcount-manual-run \
 --executor-memory 4G --conf spark.yarn.executor.memoryOverhead=4G --conf spark.yarn.driver.memoryOverhead=4G  \
 --executor-cores 4 --num-executors 1 \
 --conf "spark.executor.extraJavaOptions=-XX:+UseG1GC" \
 --conf spark.ui.port=4123 \
 --jars $(echo ../lib/*.jar | tr ' ' ',')  \
 --files log4j.properties --conf "spark.driver.extraJavaOptions=-Dlog4j.configuration=file:log4j.properties" \
 --conf "spark.executor.extraJavaOptions=-Dlog4j.configuration=file:log4j.properties" \
 --class com.cloudera.sparkwordcount.SimpleHiveApp \
 $jarFile \
 $dataFile \
  >> $logFile &

echo "Log file: $logFile "
echo "Script finished at " `date '+%Y%m%d-%H%M%S'`

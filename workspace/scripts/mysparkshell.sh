#! /bin/bash

export SPARK_PRINT_LAUNCH_COMMAND=1
export SPARK_MAJOR_VERSION=2

# spark-shell --deploy-mode client --master yarn --executor-cores 4 --executor-memory 12g --jars  /usr/share/aws/redshift/jdbc/RedshiftJDBC41.jar,/home/sudheerpalyam/myspace/deploy/jars/spark-redshift_2.11-2.0.0.jar,/home/sudheerpalyam/myspace/deploy/jars/spark-avro_2.11-4.0.0.jar,/home/sudheerpalyam/myspace/deploy/jars/minimal-json-0.9.4.jar,/home/sudheerpalyam/myspace/tools/jars/postgresql-42.1.4.jar
# --master yarn --driver-memory 8G --executor-cores 4 --executor-memory 8g --num-executors 6 --jars $(echo $libdir/*.jar | tr ' ' ',') --driver-class-path $(echo $libdir/*.jar | tr ' ' ',')

homedir=/home/d917355/workspace/scripts
jardir=/home/d917355/workspace/jars
libdir=/home/d917355/workspace/lib
spark-shell  --conf spark.ui.port=4123 \
--deploy-mode client  \
--master yarn --driver-memory 8G --executor-cores 4 --executor-memory 8g --num-executors 2



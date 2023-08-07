#!/bin/bash
export PATH=/usr/sbin:/usr/local/bin:/usr/bin:/usr/local/sbin:$PATH
export JAVA_HOME=/etc/jdk-18.0.2.1
export ORDS_HOME=/u01/app/oracle/ords
export ORDS_CONFIG=/u01/app/oracle/ords/ords_conf/ords
export ORDS_LOG=${ORDS_CONFIG}/logs/log-`date +"%Y""%m""%d"`.log
export _JAVA_OPTIONS="-Xms1126M -Xmx1126M"
nohup ${ORDS_HOME}/bin/ords --config ${ORDS_CONFIG} serve >> $ORDS_LOG 2>&1 &
echo "View log file with : tail -f $ORDS_LOG"


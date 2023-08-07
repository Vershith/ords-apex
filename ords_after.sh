#!/bin/bash
export PATH=/usr/sbin:/usr/local/bin:/usr/bin:/usr/local/sbin:$PATH
export JAVA_HOME=/etc/jdk-18.0.2.1
export ORDS_HOME=/u01/app/oracle/ords
export ORDS_CONFIG=/u01/app/oracle/ords/ords_conf/ords
export _JAVA_OPTIONS="-Xms1126M -Xmx1126M"
export APEX_IMAGES=/u01/app/oracle/apex/images

cd $ORDS_HOME/bin

./ords --config ${ORDS_CONFIG} config set standalone.static.path ${APEX_IMAGES}

./ords --config ${ORDS_CONFIG} config set standalone.access.log ${ORDS_CONFIG}/logs

./ords --config ${ORDS_CONFIG} config set jdbc.MaxLimit 30

./ords --config ${ORDS_CONFIG} config set jdbc.InactivityTimeout 30

./ords --config ${ORDS_CONFIG} config set security.httpsHeaderCheck "X-Forwarded-Proto: https"

./ords --config ${ORDS_CONFIG} config set security.externalSessionTrustedOrigins "https://test.vpcy.co.uk:443/ords/_/landing"



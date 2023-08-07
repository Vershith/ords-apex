export ORDS_HOME=/u01/app/oracle/ords
export JAVA_HOME=/etc/jdk-18.0.2.1
export HOSTNAME=10.0.0.34
export ORDS_CONFIG=/u01/app/oracle/ords/ords_conf/ords
export ORDS_LOGS=${ORDS_CONFIG}/logs
export DB_PORT=1521
export DB_SERVICE=pdb1.sub08041135160.dmvcn.oraclevcn.com
export SYSDBA_USER=SYS
export SYSDBA_PASSWORD=DEVdbfor_#123
export ORDS_PASSWORD=DEVdbfor_#123
export PATH=${ORDS_HOME}/bin:${PATH}


${ORDS_HOME}/bin/ords --config ${ORDS_CONFIG} install \
     --log-folder ${ORDS_LOGS} \
     --admin-user ${SYSDBA_USER} \
     --db-hostname ${HOSTNAME} \
     --db-port ${DB_PORT} \
     --db-servicename ${DB_SERVICE} \
     --feature-db-api true \
     --feature-rest-enabled-sql true \
     --feature-sdw true \
     --gateway-mode proxied \
     --gateway-user APEX_PUBLIC_USER \
     --proxy-user \
     --password-stdin <<EOF
${SYSDBA_PASSWORD}
${ORDS_PASSWORD}
EOF



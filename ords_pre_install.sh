#!/bin/sh

# . /etc/profile.d/oracle_env.sh

export ORDS_DEST_LOCATION=/u01/app/oracle/ords
export CONTAINER_NAME="pdb1"
export ORDS_TABLESPACE_DATA_FILE="xe_ords_tabspace_01.dat"
export APEX_PUBLIC_USER_PASSWORD="DEVdbfor_#123"
export APEX_LISTENER_PASSWORD="DEVdbfor_#123"
export APEX_REST_PUBLIC_USER_PASSWORD="DEVdbfor_#123"
export ORDS_PUBLIC_USER_PASSWORD="DEVdbfor_#123"

sudo su oracle

cd $ORDS_DEST_LOCATION

echo "ORDS Installation Script"

sqlplus /nolog <<EOF
CONNECT {{connection_string}} as sysdba

WHENEVER SQLERROR EXIT SQL.SQLCODE;

SET PAGESIZE 0 FEEDBACK OFF VERIFY OFF HEADING OFF ECHO OFF;

ALTER SESSION SET CONTAINER=$CONTAINER_NAME;
CREATE TABLESPACE {{ORDS_TABLESPACE DATAFILE '$ORDS_TABLESPACE_DATA_FILE' SIZE 10M AUTOEXTEND ON;

-- Unlock the user accounts. 
-- These should be unlocked if apex has been installed, but just to be sure.
ALTER USER apex_public_user IDENTIFIED BY "$APEX_PUBLIC_USER_PASSWORD" ACCOUNT UNLOCK;
ALTER USER apex_listener IDENTIFIED BY "$APEX_LISTENER_PASSWORD" ACCOUNT UNLOCK;
ALTER USER apex_rest_public_user IDENTIFIED BY "$APEX_REST_PUBLIC_USER_PASSWORD" ACCOUNT UNLOCK;

-- The following may fail if ORDS have not been installed in this machine before.
-- Failure can be ignored.
ALTER USER ORDS_PUBLIC_USER IDENTIFIED BY "$ORDS_PUBLIC_USER_PASSWORD" ACCOUNT UNLOCK;


EXIT;
EOF
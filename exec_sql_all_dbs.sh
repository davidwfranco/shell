#!/bin/bash
#################################################################################
##                                                                             ##
## NAME: exec_sql_all_dbs.sh                                                   ##
## OBJECTIVE: SHELL FOR RUNNING SOME SQL SCRIPT IN ALL INSTANCES OF A SERVER   ##
## CREATOR: DAVID FRANCO                                                       ##
##                                                                             ##
## IN:                                                                         ##
##   1 -> SQL SCRIPT FULL PATH                                                 ##
## OUT:                                                                        ##
##   LOG OF THE EXECUTION ON THE SAME PATH AS THE SQL SCRIPT WITH NAME:        ##
##     <SCRIPT_NAME>_<DATE-YYYYMMDD>.log                                       ##
##                                                                             ##
#################################################################################

#################################################################################
## ENV SETUP ####################################################################
#################################################################################

## GET BASIC VARIABLES FROM ORACLE USER BASH PROFILE ##
grep -Ei 'ORACLE_HOME|SID|BASE' /home/oracle/.bash_profile | while read -r line
do
  eval $line
done

## CHECK SQL SCRIPT EXISTENCE AND SET SQL_SCRIPT AND LOGFILE VAR ##
while true
do
    if [ -f "${1}" ]
    then
        SQL_SCRIPT=${1}; export SQL_SCRIPT
        break
    else
        if [ -n "${1}"]
        then
            read -p "Please input the sql script path: " SQL_SCRIPT
        else
            read -p "${1} not found, please provide the full sql script path: " SQL_SCRIPT
        fi

        if [ -f "${SQL_SCRIPT}" ]
        then
            echo "Found ${SQL_SCRIPT} !"
            break
        fi
    fi
done

export LOGFILE=`echo ${SQL_SCRIPT} | sed 's/\(.*\)\..*$/\1/g'`_$(date +%Y%m%d).log

## DELETE PREVIOUS LOGFILES FOR ORGANIZATION PURPOSES ##
rm `echo ${SQL_SCRIPT} | sed 's/\(.*\)\..*$/\1/g'`*.log > /dev/null 2>&1

#################################################################################
## EXECUTION ####################################################################
#################################################################################

## GET ALL INSTANCES ON MACHINE BY SEARCHING FOR ACTIVE PMON BACKGROUND PROCESSES ##
for INST in `ps -ef | awk -F '_' '/pmon/ && !/grep/ && !/ASM/ {print " " $3 " " | "sort"}'`
do
    export ORACLE_SID=${INST}

    echo "####################### ${INST} - INICIO - $(date +%Y/%m/%d\ %H\:%M\:%S) #######################" >> ${LOGFILE}

    ## RUN SQL SCRIPT AND SPOOL THE EXEC AND POSSIBLE ERRORS TO LOG ##
    sqlplus -S / as sysdba @$SQL_SCRIPT >> ${LOGFILE}

    echo "####################### ${INST} - FIM - $(date +%Y/%m/%d\ %H\:%M\:%S) #######################" >> ${LOGFILE}
done

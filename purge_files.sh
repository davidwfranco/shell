logDate=$(date +%Y%m%d)

logFile=<LOG_DIR>_${logdate}.log

echo "#============================== Begin Purge ==============================#" > ${logFile}
echo " " >> ${logFile}

echo "#============== Files to be Purged - d-7 ==============#" >> ${logFile}
echo " " >> ${logFile} 

find <FILES_DIR>/*.aud -mtime +<n_days> >> ${logFile}

echo " " >> ${logFile}

find <FILES_DIR>/*.aud -mtime +<n_days> -exec rm {} \;

echo "#============== Files older than 7 days purged ==============#" >> ${logFile} 

echo " " >> ${logFile}

echo "#============================== End Purge ==============================#" >> ${logFile}

# Shell Scripts
Repository of shell scripts created for work or fun(?).

## <s>exec_sql_all_dbs.sh</s> --> This script has been substituted by the more flexible and fail proof python script: <a href=https://github.com/davidwfranco/learn-python/blob/master/NotTutorialRelated/execSql.py>execSql.py</a>
Run a sql script in each oracle instance of a server, sometimes when you have some rac, or other stuff with a lot of instances in it, it's a chore to enter in each one to do something, so as a lazy person that i am i would not leave it like that...

--> Instructions
-> This script was created on demand so it's not really flexible <-
* This was created to run with oracle user, all the sqlplus connections where writed with '/ as sysdba'
* I pick up the env variables through the "/home/oracle/.bash_profile"
* The execution log is created in the same dir that the sql script

## compare_arrays.sh
Just a little try at using multiple arrays to sort through lists and comparing they

## purge_files.sh
Script created to automatize the clean up of some files that are constantly been created someware.
The "<LOG_DIR>", "<FILES_DIR>" and "<n_days>" should be substituted by the path you want to put the logs, the path of the files you wish to purge and how many days older should be the deleted files respectively

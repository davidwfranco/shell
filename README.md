# Shell Scripts
Repository of shell scripts created for work or fun(?).

## exec_sql_all_dbs.sh
Run a sql script in each oracle instance of a server, sometimes when you have some rac, or other stuff with a lot of instances in it, it's a chore to enter in each one to do something, so as a lazy person that i am i would not leave it like that...

--> Instructions
-> This script was created on demand so it's not really flexible <-
* This was created to run with oracle user, all the sqlplus connections where writed with '/ as sysdba'
* I pick up the env variables through the "/home/oracle/.bash_profile"
* The execution log is created in the same dir that the sql script


#!/bin/bash
ID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"

TIMESTMAP=$(date + %f-%H-%M-%S)
LOGFILE="/tmp/$0-$TIMESTAMP.log"
VALIDATE(){
   if [ $1 -ne 0 ]
   then
        echo -e "$2...$R Failed $N"
    else
        echoo -e "$2...$G Success $N"
    fi       
}

if [ $ID -ne O ]
then 
   echo -e  "$R error:: Please run the script with root acess $N"
   exit 1
 else 
   echo "you are root user "  
fi
cp mongo.repo /etc/yum.repos.d/mongo.repo &>>$LOGFILE
VALIDATE $? "Copied Mongodb Repo"
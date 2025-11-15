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
        echo -e "$2...$G Success $N"
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
dnf install mongodb-org -y &>> $LOGFILE
VALIDATE $? "Installing Mongodb"
systemctl enable mongod
systemctl start mongod
sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mongod.conf systemctl restart mongod
VALIDATE $? "Remote access to MongoDB"
systemctl restart mongod &>> $LOGFILE
VALIDATE $? "Restarting Mongodb"

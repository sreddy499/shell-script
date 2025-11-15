#!/bin/bash
ID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"
MONGODB_HOST=mongodb.daws7s.shop
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
 else 
   echo "you are root user "  
fi
dnf module disable nodejs -y
VALIDATE $? "Validate Nodejs Disable"
dnf module enable nodejs:18 -y
VALIDATE $? "Validate Nodejs Enable"
dnf install nodejs -y
VALIDATE $? "Validate NodeJS install"
useradd roboshop
VALIDATE $? "Validate roboshop user create"
mkdir /app
VALIDATE $? "Validate app directory"
curl -o /tmp/catalogue.zip https://roboshop-builds.s3.amazonaws.com/catalogue.zip
VALIDATE $? "Validate downlaoding catalogue"
cd /app 
unzip /tmp/catalogue.zip
VALIDATE $? "Validate unzip"
cd /app
npm install 
VALIDATE $? "Validate npm"
#use absolute path
cp /home/centos/shell-script/catalogue.service  /etc/systemd/system/catalogue.service
VALIDATE $? "Validate Copying"
systemctl daemon-reload
VALIDATE $? "deamon-reload"
systemctl enable catalogue
VALIDATE $? "Enable catalogue"
systemctl start catalogue
VALIDATE $? "start catalogue"
cp /home/centos/shell-script/mongo.repo /etc/yum.repos.d/mongo.repo
VALIDATE $? "Copying "
dnf install mongodb-org-shell -y
mongo --host $MONGODB_HOST </app/schema/catalogue.js
VALIDATE $? "LOADING MONGODB DATA"
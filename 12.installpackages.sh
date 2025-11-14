#!/bin/bash

ID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"
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
for package in $@
do 
   yum list installed $package 
   if [ $? -ne 0 ]
   then 
      yum install $package -y
      VALIDATE $? "insatallation of $package"
 done   
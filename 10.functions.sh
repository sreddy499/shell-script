#!/bin/bash
ID=$(id -u)

VALIDATE(){
if [ $1-ne 0 ]
 then 
    echo "ERROR:: $2 ..failed "
    exit 1
  else
    echo " $2 successfully installtaion done"
 fi   

}   

if [ $ID -ne 0 ]
then 
    echo "Erorr:: Please run the script"
    exit 1
else 
    echo "you are a root user"
 fi   

 yum install mysql -y   

 VALIDATE $? "installing My SQL"

 yum install git -y

 VALIDATE $? "installing GIT"
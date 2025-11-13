#!/bin/bash
ID=$(id -u)

VALIDATE(){
if [ $? -ne 0 ]
 then 
    echo "ERROR:: Installation faild"
    exit 1
  else
    echo "installtaion done"
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

 VALIDATE

 yum install git -y

 VALIDATE
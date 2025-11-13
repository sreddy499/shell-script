#!/bin/bash

ID=$(id -u)

if [ $ID -ne 0 ]
then 
    echo "Erorr:: Please run the script"
    exit 1

 fi   

 yum install mysql -y
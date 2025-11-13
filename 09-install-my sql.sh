#!/bin/bash

ID=$(id -u)

if [ $ID -ne 0 ]
then 
    echo "Erorr:: Please run the script"

 fi   
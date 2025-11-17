#!/bin/bash
file=/etc/passwd

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ ! -f $file ] # ! Denotes not exists
then
   echo -e "$R Source directory: $file R does not exists . $N
fi

while IFS=":" read -r username  
do
   echo "username: $username

done < "$file"
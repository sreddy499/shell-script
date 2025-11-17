#!/bin/bash
SOURCE_DIR="/tmp/logs"

R="\e[31m"
G="\e[32m"
N="\e[0m"

if [ ! -d $SOURCE_DIR ] # ! Denotes not exists
then
   echo -e "$R Source directory: $SOURCE_DIR does not exists . $N
fi

 FILES_TO_DELETE=$(find $SOURCE_DIR  -type f -mtime +14 -name "*.log")
 while IFS= read -r line
 do
    echo "Deleting file: $line"
    rm -rf $line
  done <<< $FILES_TO_DELETE



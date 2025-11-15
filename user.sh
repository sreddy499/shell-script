#!/bin/bash
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
curl -L -o /tmp/user.zip https://roboshop-builds.s3.amazonaws.com/user.zip
curl -o /tmp/user.zip https://roboshop-builds.s3.amazonaws.com/user.zip
VALIDATE $? "Validate downlaoding catalogue"
cd /app 
unzip /tmp/catalogue.zip
VALIDATE $? "Validate unzip"
cd /app
npm install 
VALIDATE $? "Validate npm"
cp /home/centos/shell-script/user .service  /etc/systemd/system/user.service
systemctl daemon-reload
VALIDATE $? "deamon-reload"
#ignore
systemctl enable catalogue
VALIDATE $? "Enable catalogue"
systemctl start catalogue
VALIDATE $? "start catalogue"



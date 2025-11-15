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
curl -L -o /tmp/cart.zip https://roboshop-builds.s3.amazonaws.com/cart.zip
curl -o /tmp/cart.zip https://roboshop-builds.s3.amazonaws.com/cart.zip
VALIDATE $? "Validate downlaoding cart"
cd /app 
unzip /tmp/cart.zip
VALIDATE $? "Validate unzip"
cd /app
npm install 
VALIDATE $? "Validate npm"
cp /home/centos/cart.service  /etc/systemd/system/cart.service
systemctl daemon-reload
VALIDATE $? "deamon-reload"
systemctl enable cart
VALIDATE $? "Enable cart"
systemctl start cart
VALIDATE $? "start cart"



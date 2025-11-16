#!/bin/bash
#!/bin/bash
ID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"
MONGODB_HOST=mongodb.daws7s.shop
TIMESTMAP=$(date +%f-%H-%M-%S)
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
dnf install nginx -y &>> $LOGFILE
VALIDATE $? "installing nginx"
systemctl enable nginx
VALIDATE $? "enabling nginx"
systemctl start nginx
VALIDATE $? "starting nginx"
rm -rf /usr/share/nginx/html/*
VALIDATE $? "remove default website"
curl -o /tmp/web.zip https://roboshop-builds.s3.amazonaws.com/web.zip
VALIDATE $? "downloading application"
cd /usr/share/nginx/html
VALIDATE $? "moving to nginx"
unzip -o /tmp/web.zip
cp /home/centos/shell-script/roboshop.config /etc/nginx/default.d/roboshop.conf 
systemctl restart nginx 
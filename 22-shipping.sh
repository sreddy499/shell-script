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
dnf install maven -y
useradd roboshop
VALIDATE $? "Validate roboshop user create"
mkdir /app
VALIDATE $? "Validate app directory"
curl -L -o /tmp/shipping.zip https://roboshop-builds.s3.amazonaws.com/shipping.zip
curl -o /tmp/shipping.zip https://roboshop-builds.s3.amazonaws.com/shipping.zip
VALIDATE $? "Validate downlaoding shipping"
cd /app
unzip /tmp/shipping.zip
mvn clean package
mv target/shipping-1.0.jar shipping.jar
cp /home/centos/shell-script/shipping.service /etc/systemd/system/shipping.service
VALIDATE $? "Copying shipping service"
systemctl daemon-reload
systemctl enable shipping 
systemctl start shipping
dnf install mysql -y
mysql -h mysql.daws7s.shop -uroot -pRoboShop@1 < /app/schema/shipping.sql 
systemctl restart shipping
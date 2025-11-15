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
dnf module enable redis:remi-6.2 -y
dnf install redis -y
sed -i 's/127.0.0.1/0.0.0.0/g' /etc/redis/redis.conf
systemctl enable redis
systemctl start redis
#!/bin/bash

AMI=ami-0b4f379183e5706b9
SG_ID=sg-0f9d58619498b3079
INSTANCES=("mongodb" "redis" "mysql" "rabbitmq" "catalogue" "user" "cart" "shipping" "payment" "dispatch" "web")

for i in "${INSTANCES[@]}"
do 
  if [ $i == "mongodb" ] || [ $i == "my sql" ] || [ $i == "shipping" ]
  then 
      INSTANCE_TYPE="t3.small"
  else 
      INSTANCE_TYPE="t2.micro"
   fi 

   aws ec2 run-instances --image-id ami-0b4f379183e5706b9 --count 1 --instance-type $INSTANCE_TYPE --security-group-ids sg-0f9d58619498b3079
done   
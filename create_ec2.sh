#!/bin/bash

AMI_ID="ami-0a716d3f3b16d290c" # Amazon Linux 2 (for us-east-1)
INSTANCE_TYPE="t3.micro"
KEY_NAME="my-ec2"  # Replace with your key
SECURITY_GROUP="sg-0029d2c5461e434e3"
INSTANCE_NAME="EC2WithS3Access2"


# Launch EC2 instance
INSTANCE_ID=$(aws ec2 run-instances \
  --image-id $AMI_ID \
  --instance-type $INSTANCE_TYPE \
  --key-name $KEY_NAME \
  --security-group-ids $SECURITY_GROUP \
  --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$INSTANCE_NAME}]" \
  --query "Instances[0].InstanceId" \
  --output text) \
   >/dev/null 2>&1

echo "✅ EC2 Instance Launched: $INSTANCE_NAME with id $INSTANCE_ID"

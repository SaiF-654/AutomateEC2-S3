#!/bin/bash

# Define variables
REGION="eu-north-1" # <--- Added for clarity and use in the command
BUCKET_NAME="my-s3-ec2-read-bucket-$(date +%s)"

# Create S3 bucket with LocationConstraint
aws s3api create-bucket \
--bucket $BUCKET_NAME \
--region $REGION \
--create-bucket-configuration LocationConstraint=$REGION

echo "✅ S3 bucket created: $BUCKET_NAME"
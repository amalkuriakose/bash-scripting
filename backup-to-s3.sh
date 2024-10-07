#!/bin/bash

###########################################################################
# Author - Amal                                                           #
# Description - This script compress the files and upload it to S3 bucket #
# This script requires 2 arguments, 1. source dir, 2. S3 bucket name      #
###########################################################################

echo "Script starting..."

echo "Checking the scripts arguments..."

if [ $# -eq 2 ]
then
  echo "2 arguments found..."
  echo "Script continuing..."
else
  echo "Error: Invalid arguments..."
  echo "Usage: backup.sh <source_dir> <dest_s3_bucket>"
  echo "Exiting. Please try again..."
  exit 1
fi

source_dir=$1
dest_s3_bucket=$2

echo "Checking if aws cli is installed or not..."

if command -v aws &> /dev/null
then
  echo "aws cli found"
else
  echo "Error: aws cli not found. Please install..."
  echo "Exiting..."
  exit 2
fi

echo "Checking if aws cli is configured or not..."

if [ -f ~/.aws/credentials ]
then
  echo "Credentials file found"
else
  echo "Error: aws cli not configured..."
  echo "Exiting..."
  exit 3
fi

backup_file_name=${source_dir}_$(date +%H-%M-%S).tar.gz

echo "Deleteing the tar file if exists..."

if [ -f $backup_file_name ]
then
  echo "tar file found. deleting it..."
  rm $backup_file_name
fi

echo "Compressing the source directory..."
tar -cvzf $backup_file_name $source_dir

echo "Checking if file created or not..."

if [ -f $backup_file_name ]
then
  echo "File created successfully"
  ls -lrth *.tar.gz
else
  echo "Error: file was not created"
  echo "Exiting... Try again..."
  exit 4
fi

echo "Uploading to s3..."
aws s3 cp $backup_file_name s3://$dest_s3_bucket/$(date +%Y-%m-%d)/
echo "Completed"

#!/bin/sh
timestamp=$(date "+%Y%m%d")

volume_id=vol-024130101924dd25b
name="ihdp_upi_qa_edward_"$timestamp

aws ec2 create-snapshot \
  --volume-id $volume_id \
  --description $name \
  --tag-specifications "ResourceType=snapshot,Tags=[{Key=Name,Value=$name}]"

#!/bin/bash

for region in `aws ec2 describe-regions --output text | cut -f3`
do
     echo -e "\nListing Instances in region:'$region'..."
     aws ec2 stop-instances --region $region --instance-ids $(aws ec2 describe-instances --region $region --filters "Name=instance-state-name,Values=running" --query "Reservations[].Instances[].[InstanceId]" --output text | tr '\n' ' ') > /dev/null
done

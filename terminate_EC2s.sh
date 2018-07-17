#!/bin/bash

# For all EC2 instances across all regions disable termination protection and afterwards terminate them.

for region in `aws ec2 describe-regions --output text | cut -f3`
do
     echo -e "\nListing Instances in region:'$region'..."

     for instance in `aws ec2 describe-instances --region $region --filters "Name=instance-state-name,Values=stopped" --query "Reservations[].Instances[].[InstanceId]" --output text`
     do
          aws ec2 modify-instance-attribute --region $region --instance-id $instance --no-disable-api-termination
          aws ec2 terminate-instances --region $region --instance-id $instance
     done
done

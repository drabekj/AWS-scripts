#!/bin/bash

for region in `aws ec2 describe-regions --output text | cut -f3`
do
     echo -e "\nListing Instances in region:'$region'..."

     for volume in `aws ec2 describe-volumes --region $region --query "Volumes[].[VolumeId]" --output text`
     do
          #echo -e "volume: '$volume'"
          aws ec2 detach-volume --region $region --volume-id $volume
          aws ec2 delete-volume --region $region --volume-id $volume
     done

     #aws ec2 detach-volume --volume-id $(aws ec2 describe-volumes --region $region --query "Volumes[].[VolumeId]" --output text | tr '\n' ' ')
done

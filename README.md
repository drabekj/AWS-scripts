# AWS-scripts
Scripts to stop all activity on your AWS account (stop EC2 instances, delete volumes).

## Why? 🤷‍♂️
I got hack, be prepared.☠️  
When I was experimenting and learning how to work with AWS I accidentally pushed my AWS Access key somewhere in the git history with my project to GitHub. After only a couple minutes I noticed many EC2 instances spinning up. Someone got access to my account and started as many computing instances as he could to mine crypto. If I had scripts to automatically stop all of the instances, it would have saved me a lot of money and trouble.  
After only a couple minutes my bill was huge, over $1,600!💸🔥

## Warning ⚠️
‼️ Do not run these scripts if you want to preserve some of your EC2 instances! The stop/delete action is applied to all of the instances across all regions. ‼️

## Usage 🔧
1. First of all, you have to set up the AWS CLI, the official documentation is a good start. (https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-welcome.html)  
2. Add execute permission to the desired script file: `chmod +x script_name.sh`
3. Simply run the script: `./script_name`

## Description

### Stop script
`stop_EC2s.sh`
Stops all the EC2 instances across all regions, instances won't be deleted. To delete the instances (terminate) you need to run the termination script.

### Termination script
`terminate_EC2s.sh`
Deletes (terminates) all the EC2 instances across all regions, instances must first be stopped in order to be terminated; use the stop script. The termination script first removes the termination protection and terminates the instance afterward.

### Delete volumes script
`delete_EC2_volumes.sh`
Detaches and deletes all EC2 volumes across all regions.
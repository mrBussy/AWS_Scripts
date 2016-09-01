# Prerequisites
Access to both the buckets is required with aws script. 

# Access privileges
In order to get the privileges use the AWS Access Key and Secret Access key as provided by the System Administrator
Follow the instructions https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html to setup the AWS CLI required to run this script

# Usage
cp_files.sh files s3://source/folder s3://destination/folder

files: A plain text file that contains a list of files to retrieve from the source and place in destination

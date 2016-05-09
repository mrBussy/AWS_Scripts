#!/bin/bash
if [[ -z "$3" ]]
then
    echo "usage: cp_files files_file origin destination"
    exit -1
fi

echo "Starting copying the files"

if [[ -z "$2" ]]; then
    exit -1
else
    ORG=$2
fi

if [[ -z "$3" ]]; then
    exit -2
else
    DEST=$3
fi

# Close STDERR FD
exec 2<&-

# Open STDOUT as $LOG_FILE file for read and write.
exec 2<>cp.log

# Copy each file in the list
awk -v org=$ORG -v dest=$DEST -F: '{ printf("aws s3 cp %s/%s %s/%s\n", org, $0, dest, $0)}' $1 | sh 
# TODO: Write check to see if we copy from HTTP location. If so, use script below
#awk -v org=$ORG -v dest=$DEST -F: '{ printf("curl %s/%s --output %s; aws s3 cp %s %s/%s; rm %s\n", org, $0, $0, $0, dest, $0, $0)}' $1 | sh

echo "Done copying the files"

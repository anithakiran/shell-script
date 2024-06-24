#!/bin/bash

source_directory=/tmp/app-logs
R="\e[31m"
G="\e[32m"
N="\e[0m"

if [ -d $source_directory ]
then 
    echo -e "$G soruce_directory exist $N"
else
    echo -e "$R pleaase make sure $source_directory exist $N"
    exit 1
fi


FILES=$(find $source_directory -name "*.log" -mtime +14)

while IFS = read -r line
do
    echo "deleting file: $line"
    rm -rf $line
done <<< $FILES




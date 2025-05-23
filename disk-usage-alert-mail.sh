#!/bin/bash

DISK_USAGE=$(df -hT|grep xfs)
DISK_THRESHOULD=5
MESSAGE=" "
while IFS= read -r line
do
USAGE=$(echo $line | awk -F " " '{print $6f}' |cut -d "%" -f1)
FOLDER=$(echo $line | aws -F " " '{print $NF}')
if [ $USAGE -ge $DISK_THRESHOULD]
then 
MESSAGE+="$FOLDER is more than $DISK_THRESHOULD , current usage : $USAGE \n"
fi
done <<< $DISK_USAGE

echo -e "Message : $MESSAGE" 
#!/bin/bash

#set -e

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "please run the script using root access........"
    exit 1
else 
    echo "your super user....."
fi

dnf install mysql -y
dnf install gitt -y
dnf install dockker -y

echo "is still script working ?..........."
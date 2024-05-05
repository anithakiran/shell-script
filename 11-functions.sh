#!/bin/bash

USERID=$(id -u)

if [ $? -ne 0 ]
then    
    echo "installation is failure"
else
    echo "installation is successfull"
fi

if [ $UserID -ne 0 ]
then 
    echo "please run this script with root access"
    exit 1
else
    echo "your are super user"
fi

dnf install mysql -y
echo "is script processing?"


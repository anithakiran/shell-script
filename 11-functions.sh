#!/bin/bash

USERID=$(id -u)

VALIDATE() {
    if [ $1 -ne 0 ]
    then    
        echo "$2.....  failure"
    else
        echo "$2..... successfull"
    fi
}

if [ $USERID -ne 0 ]
then 
    echo "please run this script with root access"
    exit 1
else
    echo  "your are super user"
fi

dnf install mysql -y 
VALIDATE $? "Installing mysql"

dnf install git -y
VALIDATE $? "Installing git"

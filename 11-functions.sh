#!/bin/bash

USERID=$(id -u)

VALIDATE() {
    if [ $1 -ne 0 ]
    then    
        echo "installation is failure"
    else
        echo "installation is successfull"
    fi
}

if [ $UserID -ne 0 ]
then 
    echo "please run this script with root access"
    exit 1
else
    echo "your are super user"
fi

dnf install mysql -y 
VALIDATE $? "Installing mysql"

dnf install git -y
VALIDATE $? "Installing git"

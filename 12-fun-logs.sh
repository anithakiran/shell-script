#!/bin/bash

USERID=$(id -u)

TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1 )
LOGFILE = /tmp/$SCRIPT_NAME-$TIMESTAMP.log

USERID=$(id -u)

VALIDATE() {
if [ $1 -ne 0 ]
then    
    echo "installation is failure"
else
    echo "installation is successfull"
fi
}

if [ $USERID -ne 0 ]
then 
    echo "please run this script with root access"
    exit 1
else
    echo "your are super user"
fi

dnf install mysql -y &>>$LOGFILE
VALIDATE $? "Installing mysql"

dnf install git -y &>>$LOGFILE
VALIDATE $? "Installing git"



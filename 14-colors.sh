#!/bin/bash

USERID=$(id -u)

TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1 )
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log
R="\e[31m"
G="\e[32m"
N="\e[0m"

echo "script started executing at : $TIMESTAMP"

VALIDATE() {
if [ $? -ne 0 ]
then    
    echo -e "installation is $R failure $N "
else
    echo -e "installation is $G successfull $N"
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

dnf install dockker -y &>>$LOGFILE
VALIDATE $? "installing docker"
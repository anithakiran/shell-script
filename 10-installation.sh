#!/bin/bash

SUSERID=$(id -u)

if [ $UserID -ne 0]
then
    echo "please run the script with root access"
else
    echo "you are super usder"
fi

dnf install mysql -y

if [$? -ne 0 ]
then    
    echo "installation of mysql is failure"
    exit 1
else 
    echo "installation of mysql is success"
fi
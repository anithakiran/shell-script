#!/bin/bash

set -e


#trap 'failure ${LINENO} "$BASH_COMMAND"' ERR

#failure(){
 #   echo "failed at $1:$2"
#}

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

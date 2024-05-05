#!/bin/bash

echo "ALL variables :$@"
echo "Number of variables :$#"
echo "Name of script : $0"
echo "Current working directory : $PWD"
echo "Home directory of current user : $HOME"
echo "Which user is running this script : $USER"
echo "hostname : $HOSTNAME"
echo "process id of the current shell script:$$"
echo "process id of last background cmd :$!"


#!/bin/bash

if [ $# -ne 2 ]
then
    echo "please enter only two numbers"
    echo "please enter values has shown ---> script_name.sh  x y"
    echo "so x and y values will be added and sum values be given"
fi

echo "sum of two numbers is `expr $1 + $2`"

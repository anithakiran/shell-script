#!/bin/bash

today=$(date +%A)

if($today=sunday)
{
    echo "it's holiday";
}
else
{
    echo "go to school";
}d
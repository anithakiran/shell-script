#!/bin/bash
dir="." #current directory we can given path to other directory
if [ -d "$dir" ]; then
    count=$(ls -1q "$dir" | wc -l) 
    echo "The number of files in $dir is $count"
else
    echo "Directory $dir does not exist"
fi

#  -1: Ensures that the output is one entry per line.
# -q: Forces non-printable characters in file names to be replaced with ? 
# (useful for cleaner counting if special characters are present)
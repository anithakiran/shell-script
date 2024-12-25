#!/bin/bash

# Check if a filename is provided
if [ $# -ne 1 ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

filename="$1"

# Transpose the file using awk
awk '
{ 
    for (i=1; i<=NF; i++) {
        if (NR == 1) {
            a[i] = $i
        } else {
            a[i] = a[i] " " $i
        }
    }
}
END {
    for (i=1; a[i]!=""; i++) {
        print a[i]
    }
}' "$filename"
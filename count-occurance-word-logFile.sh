#!/bin/bash
log_file="111.log"
string="ERROR"

if [ -f "$log_file" ]; then
    count=$(grep -oi "$string" "$log_file" | wc -l)
    echo "The string '$string' appears $count times in $log_file"
else
    echo "Log file $log_file does not exist"
fi

# -o: This option tells grep to only output the matching part of each line, not the entire line.
#  For example, if you're searching for the string "error", and a line contains "Error occurred", 
# grep -o would output just "error".
# The -i flag makes the search case-insensitive, so it will match ERROR, error, Error, etc.

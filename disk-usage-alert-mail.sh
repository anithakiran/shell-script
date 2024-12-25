#!/bin/bash

# Get disk usage details for filesystems of type xfs
DISK_USAGE=$(df -hT | grep xfs)
DISK_THRESHOULD=5
MESSAGE=""

# Loop through each line of disk usage information
while IFS= read -r line; do
    # Debugging: Print the line being processed
    echo "Processing line: $line"

    # Extract the disk usage percentage and the folder (mount point)
    USAGE=$(echo "$line" | awk '{print $6}' | tr -d '%')
    FOLDER=$(echo "$line" | awk '{print $NF}')
    
    # Debugging: Print extracted values
    echo "Extracted USAGE: $USAGE"
    echo "Extracted FOLDER: $FOLDER"

    # Check if USAGE is not empty and is a valid integer
    if [[ -n "$USAGE" && "$USAGE" =~ ^[0-9]+$ ]]; then
        if [ "$USAGE" -ge "$DISK_THRESHOULD" ]; then
            MESSAGE+="$FOLDER is more than $DISK_THRESHOULD%, current usage: $USAGE% \n"
        fi
    else
        echo "Invalid or empty USAGE value: $USAGE"
    fi
done <<< "$DISK_USAGE"

# Display the message
if [ -n "$MESSAGE" ]; then
    echo -e "Message:\n$MESSAGE"
else
    echo "No filesystem exceeds the threshold."
fi

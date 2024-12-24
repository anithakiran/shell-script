#!/bin/bash

# Get the filename from the user
echo "Enter the name of the file: "
read filename

# Check if the file exists
if [ ! -f "$filename" ]; then
    echo "File does not exist."
    exit 1
fi

# Create a dictionary to store the word counts
declare -A word_counts

# Read the file line by line
while read line; do

    # Split the line into words
    words=($line)

    # Iterate over the words
    for word in "${words[@]}"; do

        # Increment the count for the word
        word_counts[$word]=$((word_counts[$word] + 1))

    done

done < "$filename"

# Print the word counts
for word in "${!word_counts[@]}"; do

    echo "$word: ${word_counts[$word]}"

done
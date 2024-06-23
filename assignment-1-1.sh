#!/bin/bash

echo -p Enter the filename
read filename

if [ ! -f "$filename" ] 
then 
    echo "file doesn't exist"
    exit 1
fi

declare -A word_counts

while IFS= read -r line;
do
clean_line=$(echo "$line" | tr '[:upper:]' '[:lower:]' | tr -d '[:punct:]')
words=($clean_line)
for word in "${(words[@])}";
do
word_counts[$word]=$((word_counts[$word] + 1))
done

done < "$filename"

for word in "${!word_counts[@]}";
do
echo "$word: ${word_counts[$word]}"
done
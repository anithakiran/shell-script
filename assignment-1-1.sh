#!/bin/bash

echo  Enter the filename
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
for word in "${words[@]}";
do
word_counts[$word]=$((word_counts[$word] + 1))
done

done < "$filename"

for word in "${!word_counts[@]}";
do
echo "$word: ${word_counts[$word]}"
done
echo " "
echo " "
top_words=$(for word in "${!word_counts[@]}"; do
    echo "$word ${word_counts[$word]}"
done | sort -k2 -nr | head -n 5)

echo "Top 5 most frequent words:"
echo "$top_words"
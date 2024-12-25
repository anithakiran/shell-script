#!/bin/bash

echo  Enter the filename
read filename

if [ ! -f "$filename" ] 
then 
    echo "file doesn't exist"
    exit 1
fi

declare -A word_counts #declares a empty associative array, array in which elements are stored in key value pair where value is accessed using key

#Internal Field Separator --> IFS 
while IFS= read -r line;
do
#removes all uppercase letter to lower and removes all punctuation marks in given file 
clean_line=$(echo "$line" | tr '[:upper:]' '[:lower:]' | tr -d '[:punct:]')
words=($clean_line) # content is passed to loop and check how many times each word is repating
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
done | sort -k2 -nr | head -n 6)

echo "Top 5 most frequent words:"
echo "$top_words"
#!/bin/bash
read -p "Enter the number of terms: " n

a=0
b=1
echo "Fibonacci Series:"
for (( i=0; i<n; i++ )); do
    echo -n "$a "
    fn=$((a + b))
    a=$b
    b=$fn
done
echo

# i=0 0<5 0 => "0" => 0+1=1 => a=1 b=1
# i=1 1<5 1 => "1" => 1+1=2 => a=1 b=2
# i=2 2<5 2 => "1" => 1+2=3 => a=2 b=3
# i=3 3<5 3 => "2" => 2+3=5 => a=3 b=5
# i=4 4<5 4 => "3" => 3+5=8 => a=5 b=8
# i=5 5<5 5 => "5" => 5+8=13 => a=8 b=13

# 0 1 1 2 3 5 8

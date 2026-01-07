#!/bin/bash

echo "Please enter 20 numbers one by one:"


read -p "Number 1: " num
largest=$num
smallest=$num


for i in {2..20}
do
    read -p "Number $i: " num
    

    if [ "$num" -gt "$largest" ]; then
        largest=$num
    fi
    

    if [ "$num" -lt "$smallest" ]; then
        smallest=$num
    fi
done

echo "*******************************"
echo "The largest number is: $largest"
echo "The smallest number is: $smallest"


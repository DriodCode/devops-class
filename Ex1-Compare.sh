#!/bin/bash

read -p "Enter a number: " num

if ! [[ "$num" =~ ^-?[0-9]+$ ]]; then
    echo "Error: Please enter a valid integer."
    exit 1
fi


if [ "$num" -gt 10 ]; then
    echo "larger"
elif [ "$num" -lt 10 ]; then
    echo "smaller"
else
    echo "equal"
fi


#!/bin/bash

number=$2

if [ $number>20 ]; then
echo "the given number $number : is greater than 20"
elif [ $number -eq 20 ]; then
echo "the given number $number : is equal than 20"

else
echo "the given number $number : is less than 20"

fi

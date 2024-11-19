#!/bin/bash

read -p "Введите число: " number

if (( $(echo "$number > 0" | bc) )); then
    echo "Число положительное."
    
    for (( count=1; count<=number; count++ )); do
        echo $count
    done
    
elif (( $(echo "$number < 0" | bc) )); then
    echo "Число отрицательное."
else
    echo "Число равно нулю."
fi

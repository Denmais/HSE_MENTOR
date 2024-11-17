#!/bin/bash

read -p "Введите число: " number

# Проверяем, является ли число положительным, отрицательным или нулем
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

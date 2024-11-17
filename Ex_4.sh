#!/bin/bash

# Функция для приветствия
hello() {
    local name="$1"
    echo "Hello, $name"
}

# Функция для сложения двух чисел
add() {
    local a=$1
    local b=$2
    echo $((a + b))
}


read -p "Введите строку: " string

hello $string

read -p "Введите число_1: " num1
read -p "Введите число_2: " num2

result=$(add num1 num2)

echo "Сумма $num1 и $num2 равна: $result"

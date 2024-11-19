#!/bin/bash

# Проверки
if [ "$#" -ne 2 ]; then
    echo "Использование: $0 <имя_файла> <слово_для_поиска>"
    exit 1
fi

F=$1
W=$2

if [ ! -f "$F" ]; then
    echo "Ошибка: Файл '$F' не найден."
    exit 1
fi

COUNT=$(grep -o -i "$W" "$F" | wc -l)

echo "Слово '$W' встречается в файле '$F' $COUNT раз."

#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Необходимо ввести название файла в качестве аргумента: $0 <имя_файла>"
    exit 1
fi

filename="$1"

echo "Список файлов в текущей директории с указанием их типа:"
for item in *; do
    if [ -d "$item" ]; then
        echo "$item - каталог"
    elif [ -f "$item" ]; then
        echo "$item - файл"
    elif [ -L "$item" ]; then
        echo "$item - символическая ссылка"
    else
        echo "$item - неизвестный тип"
    fi
done

echo ""

if [ -e "$filename" ]; then
    echo "Файл '$filename' найден."
else
    echo "Файл '$filename' не найден."
fi

echo ""

echo "Информация о файлах и их правах доступа:"
for item in *; do
    if [ -e "$item" ]; then
        permissions=$(ls -l "$item" | awk '{print $1}')
        echo "$item - права доступа: $permissions"
    fi
done



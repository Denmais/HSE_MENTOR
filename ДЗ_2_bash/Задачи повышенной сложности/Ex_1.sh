#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "В аргументах нет директории!"
    exit 1
fi

DIR="$1"
DATE=$(date +%Y-%m-%d)
LOG="log_$DATE.txt"

if [ ! -d "$DIR" ]; then
    echo "Ошибка: Директория '$DIR' не существует."
    exit 1
fi

count=0
for file in "$DIR"/*; do
    if [ -f "$file" ]; then

        filename=$(basename "$file") # имя файла
        echo "$filename"
        cp "$file" "$DIR/${filename}_$DATE.${filename}"
        echo "Файл кэширован: ${filename}_${DATE}" >> "$LOG"
        ((count++))
    fi
done

echo "Скопировано файлов: $count"
echo "Логи операций '$LOG'."


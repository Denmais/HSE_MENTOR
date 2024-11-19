#!/bin/bash

read -p "Введите директорию" directory

if [ ! -d "$directory" ]; then
    echo "Путь '$directory' не является директорией."
    exit 1
fi

for file in "$directory"/*; do
    if [ -f "$file" ]; then
        filename=$(basename "$file")
        # Переименовываем файл, добавляя префикс
        mv "$file" "$directory/backup_$filename"
        echo "Префикс 'backup_' добавлен к файлу '$filename'."
    fi
done

echo "Done!"

#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Использование: $0 <директория>"
    exit 1
fi

DIRECTORY=$1

if [ ! -d "$DIRECTORY" ]; then
    echo "Ошибка: Директория '$DIRECTORY' не найдена."
    exit 1
fi

find "$DIRECTORY" -type f -mtime +7 -exec rm {} ;

echo "Файлы, измененные более 7 дней назад, были удалены из '$DIRECTORY'."

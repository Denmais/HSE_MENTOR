#!/bin/bash

# Чтение данных из файла input.txt
if [[ -f input.txt ]]; then
    cat input.txt | wc -l > output.txt
else
    echo "Файл input.txt не найден."
    input.txt 2> error.log # направить стандартный поток ошибок в файл.
fi

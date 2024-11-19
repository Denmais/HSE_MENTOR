#!/bin/bash
SRC="/home/dev/Data_Engineering/homework/HSE_MENTOR/ДЗ_2_bash/Задачи повышенной сложности"
IMG="$SRC/Images"
DOC="$SRC/Documents"

mkdir -p "$IMG"
mkdir -p "$DOC"

for item in "$SRC"/*.{png,jpg,gif}; do
    if [ -e "$item" ]; then
        mv "$item" "$IMG/"
    fi
done

for item in "$SRC"/*.{pdf,txt,docx}; do
    if [ -e "$item" ]; then
        mv "$item" "$DOC/"
    fi
done

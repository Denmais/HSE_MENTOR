#!/bin/bash

# Функция для получения ресурсов
check_resources() {
    
    cpu=$(top -bn1 | grep "Cpu(s)" | \
           sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | \
           awk '{print 100 - $1"%"}') # Получаем загрузку процессора
    
    
    memory=$(free | grep Mem | awk '{print $3/$2 * 100.0}') # Получаем использование памяти
    
    
    disk=$(df / | grep / | awk '{ print $5 }' | sed 's/%//g') # Получаем использование дискового пространства

#    echo "$cpu $memory $disk"
}

# Функция для получения самых загруженных по памяти процессов
get_top_memory_processes() {
    echo "Топ процессов по использованию памяти:"
    ps -eo pid,comm,%mem --sort=-%mem | head -n 8
}

# get_top_memory_processes
check_resources

    echo "Загрузка процессора: $cpu %"
    echo "Использование памяти: $memory %"
    echo "Использование дискового пространства: $disk %"
   
   new_memory=$(echo "$memory" | tr ',' '.')
   
    if (( $(echo "$new_memory > 80" | bc -l) )); then
        echo "Использование памяти > 80 %. -> $new_memory"
        get_top_memory_processes
    fi


#!/bin/bash

LENGTH=${1:-10}  # Длина последовательности, по умолчанию 10

for ((i=0; i<LENGTH; i++)); do
    # Генерация случайного числа в диапазоне 0-25 (A-Z)
    RAND=$((RANDOM % 26))
    # Преобразование в букву (A=65 в ASCII)
    LETTER=$(printf \\$(printf '%03o' $((RAND + 65))))
    echo -n $LETTER
done
echo

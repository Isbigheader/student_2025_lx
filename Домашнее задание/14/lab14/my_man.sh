#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Использование: ./my_man.sh <команда>"
    exit 1
fi

MAN_FILE="/usr/share/man/man1/$1.1.gz"

if [ -f "$MAN_FILE" ]; then
    less "$MAN_FILE"
else
    echo "Справка по команде '$1' не найдена"
fi

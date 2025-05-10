#!/bin/bash

if [ "$1" = "clean" ]; then
  rm -f *.tmp
  echo "Все файлы удалены."
else
  if [ -z "$1" ]; then
    echo "Укажите число файлов для создания или 'clean' для удаления."
    exit 1
  fi

  for ((i=1; i<=$1; i++)); do
    touch "$i.tmp"
  done
  echo "Создано $1 файлов."
fi

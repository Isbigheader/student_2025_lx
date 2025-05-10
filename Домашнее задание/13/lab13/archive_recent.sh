#!/bin/bash

if [ $# -eq 0 ]; then
  echo "Как использовать: $0 Путь к каталогу"
  exit 1
fi

# 检查目录是否存在
if [ ! -d "$1" ]; then
  echo "ошибка: каталог $1 не существует"
  exit 1
fi

archive_name="recent_backup_$(date +%Y%m%d_%H%M%S).tar.gz"

echo "Архивация файлов, измененных в течение 7 дней..."
find "$1" -type f -mtime -7 -print0 | tar -czvf "$archive_name" --null -T -

echo "Архив завершен!"
echo "Архивный файл создан: $(ls -lh $archive_name)"

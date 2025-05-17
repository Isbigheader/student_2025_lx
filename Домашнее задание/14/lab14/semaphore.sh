#!/bin/bash

LOCK_FILE="/tmp/resource.lock"
WAIT_TIME=$1
USE_TIME=$2

echo "Процесс $$ ожидает освобождения ресурса..."

while [ -f "$LOCK_FILE" ] && [ $WAIT_TIME -gt 0 ]; do
    sleep 1
    WAIT_TIME=$((WAIT_TIME-1))
    echo "Процесс $$: ресурс занят, осталось времени ожидания: $WAIT_TIME сек"
done

if [ $WAIT_TIME -le 0 ]; then
    echo "Процесс $$: время ожидания истекло, выход"
    exit 1
fi

touch "$LOCK_FILE"
echo "Процесс $$: ресурс получен, использование в течение $USE_TIME сек"
sleep $USE_TIME
rm -f "$LOCK_FILE"
echo "Процесс $$: ресурс освобожден"

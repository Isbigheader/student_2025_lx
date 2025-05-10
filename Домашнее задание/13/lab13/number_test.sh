./number_check
exit_code=$?

case $exit_code in
  0) echo "Число равно нулю." ;;
  1) echo "Число больше нуля." ;;
  2) echo "Число меньше нуля." ;;
  *) echo "Неизвестный код завершения." ;;
esac

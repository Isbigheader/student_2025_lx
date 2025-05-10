while getopts "i:o:p:Cn" opt; do
  case $opt in
    i) inputfile=$OPTARG ;;
    o) outputfile=$OPTARG ;;
    p) pattern=$OPTARG ;;
    C) case_sensitive=1 ;;
    n) show_numbers=1 ;;
    *) echo "Неверный ключ: -$OPTARG" >&2
       exit 1 ;;
  esac
done

if [ -z "$inputfile" ] || [ -z "$pattern" ]; then
  echo "Необходимо указать входной файл (-i) и шаблон (-p)" >&2
  exit 1
fi

grep_command="grep"
if [ "$case_sensitive" ]; then
  grep_command="$grep_command"
else
  grep_command="$grep_command -i"
fi

if [ "$show_numbers" ]; then
  grep_command="$grep_command -n"
fi

if [ "$outputfile" ]; then
  $grep_command "$pattern" "$inputfile" > "$outputfile"
else
  $grep_command "$pattern" "$inputfile"
fi

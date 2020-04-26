function mkd() {
    mkdir -p "$@" && cd "$_"
}

function mkf() {
  mkdir -p "$(dirname "$1")" && touch "$1";
}

function open() {
  xdg-open "$@">/dev/null 2>&1
}

function myip() {
  for ip in $(hostname -I)
  do
    echo $ip
  done
}

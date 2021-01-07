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

function reset-permissions() {
  if [[ $# -eq 0 ]] ; then
    echo "usage: reset-permissions <path>"
    return 1
  elif [[ -d $1 ]] ; then
    find $1 -type d -print0 | xargs -0 chmod 0775
    find $1 -type f -print0 | xargs -0 chmod 0664
  else
    chmod 664 $1
  fi
}

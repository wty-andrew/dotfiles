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

function huion() {
  case $1 in
    krita)
      xsetwacom set "HID 256c:006d Pad pad" Button 1 "key +ctrl +z -z -ctrl" # undo
      xsetwacom set "HID 256c:006d Pad pad" Button 2 "key +ctrl +shift +z -z -ctrl -shift" # redo
      xsetwacom set "HID 256c:006d Pad pad" Button 3 "key e" # toggle eraser mode
      xsetwacom set "HID 256c:006d Pad pad" Button 8 "key ctrl"
      xsetwacom set "HID 256c:006d Pad pad" Button 9 "key shift"
      xsetwacom set "HID 256c:006d Pad pad" Button 10 "key alt"
      ;;
    blender)
      # TODO: 
      ;;
    *)
      echo "usage: huion [krita|blender]"
      return 1
  esac
}

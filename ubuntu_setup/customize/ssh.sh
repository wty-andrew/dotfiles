setup_ssh() {
  if [[ ! -f $HOME/.ssh/id_rsa.pub ]]; then
    cat /dev/zero | ssh-keygen -t rsa -b 4096 -q -N "" -C "" > /dev/null
  fi
}

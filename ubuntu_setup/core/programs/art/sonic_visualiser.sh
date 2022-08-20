check_sonic_visualiser() {
  [[ -x "$(command -v sonic-visualiser)" ]]
}

install_sonic_visualiser() {
  sudo apt install -y sonic-visualiser
}

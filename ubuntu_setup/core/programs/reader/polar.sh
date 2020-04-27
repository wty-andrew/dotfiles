check_polar() {
  [[ -x "$(command -v polar-bookshelf)" ]]
}

install_polar() {
  sudo snap install polar-bookshelf
}

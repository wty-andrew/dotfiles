install_zsh() {
  sudo apt install -y zsh
}

postinstall_zsh() {
  chsh -s /bin/zsh
}

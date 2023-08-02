install_starship() {
  curl -sS https://starship.rs/install.sh | sh
}

install_zim() {
  curl -fsSL https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh
}

install_zoxide() {
  curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash
}

setup_zsh() {
  sudo apt install -y fzf
  install_starship
  install_zim
  install_zoxide
}

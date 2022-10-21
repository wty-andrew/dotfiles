install_diff_so_fancy() {
  sudo add-apt-repository ppa:aos1/diff-so-fancy -y
  sudo apt update
  sudo apt install -y diff-so-fancy
}

setup_git() {
  install_diff_so_fancy
}

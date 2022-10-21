install_starship() {
  curl -sS https://starship.rs/install.sh | sh
}

install_zsh_snap() {
  [[ -f $HOME/.znap/zsh-snap/znap.zsh ]] ||
  mkdir -p $HOME/.znap
  git clone https://github.com/marlonrichert/zsh-snap.git $HOME/.znap/zsh-snap
}

setup_zsh() {
  sudo apt install -y fzf zoxide
  install_starship
  install_zsh_snap
}

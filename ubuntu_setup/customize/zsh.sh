install_oh_my_zsh() {
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
}

install_zsh_configuration() {
  git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
  git clone https://github.com/marlonrichert/zsh-autocomplete ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-autocomplete

  cp $FILES_DIR/bullet-train.zsh-theme ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/themes
}

setup_zsh() {
  install_oh_my_zsh
  install_zsh_configuration
}

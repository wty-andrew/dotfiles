install_oh_my_zsh() {
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
}

install_zsh_configuration() {
  git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
  git clone https://github.com/esc/conda-zsh-completion ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/conda-zsh-completion
  git clone https://github.com/gradle/gradle-completion ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/gradle-completion

  cp $FILES_DIR/bullet-train.zsh-theme ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/themes
}

setup_zsh() {
  install_oh_my_zsh
  install_zsh_configuration
}

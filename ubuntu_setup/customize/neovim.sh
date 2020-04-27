install_vim_plug() {
  if [[ ! -f $HOME/.config/nvim/autoload/plug.vim ]]; then
    curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  fi
}

install_vim_configuration() {
  vim +PlugInstall +qall
}

setup_neovim() {
  install_vim_plug
  install_vim_configuration
}

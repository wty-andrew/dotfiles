install_fcitx_configuration() {
  mkdir -p $HOME/.config/fcitx
  sudo cp $FILES_DIR/fcitx/boshiamy.mb /usr/share/fcitx/table
  cp $FILES_DIR/fcitx/config $HOME/.config/fcitx
}

setup_input_method() {
  install_fcitx_configuration
}

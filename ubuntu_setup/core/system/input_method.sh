check_input_method() {
  [[ $(im-config -l) =~ "fcitx" ]]
}

install_input_method() {
  sudo apt install -y fcitx-table-boshiamy fcitx-chewing
}

postinstall_input_method() {
  im-config -n fcitx
}

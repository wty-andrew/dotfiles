check_vscode() {
  [[ -x "$(command -v code)" ]]
}

install_vscode() {
  sudo snap install code --classic
}

postinstall_vscode() {
  code --install-extension Shan.code-settings-sync
}

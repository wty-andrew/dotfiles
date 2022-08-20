install_dolphin() {
  sudo apt install -y breeze-icon-theme dolphin
}

postinstall_dolphin() {
  xdg-mime default org.kde.dolphin.desktop inode/directory
}


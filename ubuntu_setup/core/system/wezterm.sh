install_wezterm() {
  cd $TEMPORARY_DOWNLOAD_PATH
  curl -LO https://github.com/wez/wezterm/releases/download/20230712-072601-f4abf8fd/wezterm-20230712-072601-f4abf8fd.Ubuntu22.04.deb
  sudo apt install -y ./wezterm-20230712-072601-f4abf8fd.Ubuntu22.04.deb
}

postinstall_wezterm() {
  sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator $(which wezterm) 50
  sudo update-alternatives --auto x-terminal-emulator
}

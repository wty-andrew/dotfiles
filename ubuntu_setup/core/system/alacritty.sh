install_alacritty() {
  sudo apt install -y cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3 libegl1-mesa-dev 
  cd $SOURCE_CODE_DOWNLOAD_PATH
  git clone https://github.com/alacritty/alacritty.git && cd alacritty
  cargo build --release
  sudo tic -xe alacritty,alacritty-direct extra/alacritty.info
  sudo cp target/release/alacritty /usr/local/bin
  sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
  sudo desktop-file-install extra/linux/Alacritty.desktop
  sudo update-desktop-database
}

postinstall_alacritty() {
  sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator $(which alacritty) 50
  sudo update-alternatives --auto x-terminal-emulator
}

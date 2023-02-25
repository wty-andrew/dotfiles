check_neovim() {
  [[ -x "$(command -v nvim)" ]]
}

install_neovim() {
  sudo apt install -y python3-neovim
  # neovim in apt (current 0.6) is too old for vscode plugin)
  cd $TEMPORARY_DOWNLOAD_PATH
  curl -OL https://github.com/neovim/neovim/releases/download/v0.8.3/nvim-linux64.deb
  sudo gdebi -n nvim-linux64.deb
}

postinstall_neovim() {
  sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
  sudo update-alternatives --auto vi
  sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
  sudo update-alternatives --auto vim
  sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
  sudo update-alternatives --auto editor
}

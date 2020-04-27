check_neovim() {
  [[ -x "$(command -v nvim)" ]]
}

install_neovim() {
  sudo apt install -y neovim
}

postinstall_neovim() {
  sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
  sudo update-alternatives --auto vi
  sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
  sudo update-alternatives --auto vim
  sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
  sudo update-alternatives --auto editor
}

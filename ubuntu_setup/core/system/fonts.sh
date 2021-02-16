check_fonts() {
  [[ -d $HOME/.local/share/fonts/source-code-pro ]]
}

install_fonts() {
  sudo apt install -y fonts-powerline fonts-firacode fonts-humor-sans

  mkdir -p $HOME/.local/share/fonts && cd $_
  git clone -b release --depth 1 https://github.com/adobe-fonts/source-code-pro.git
  fc-cache -f $HOME/.local/share/fonts
}

setup_fonts() {
  sudo apt install -y fonts-powerline fonts-noto-color-emoji fonts-firacode fonts-humor-sans

  mkdir -p $HOME/.local/share/fonts && cd $_
  git clone -b release --depth 1 https://github.com/adobe-fonts/source-code-pro.git

  cp $DOTFILES_ROOT/fonts/MaterialIcons/MaterialIcons-Regular.ttf $HOME/.local/share/fonts
  cp $DOTFILES_ROOT/fonts/Ubuntu\ Mono\ Nerd\ Font/Ubuntu\ Mono\ Nerd\ Font\ Complete.ttf $HOME/.local/share/fonts
  cp $DOTFILES_ROOT/fonts/DejaVu\ Sans\ Mono\ Nerd\ Font\ Complete\ Mono.ttf $HOME/.local/share/fonts
  cp $DOTFILES_ROOT/fonts/NotoSansMonoCJK/NotoSansMonoCJKtc-Regular.otf $HOME/.local/share/fonts

  fc-cache -f $HOME/.local/share/fonts
}


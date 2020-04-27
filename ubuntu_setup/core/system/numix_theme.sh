check_numix_theme() {
  local CURRENT_GTK_THEME=$(gsettings get org.gnome.desktop.interface gtk-theme)
  local CURRENT_ICON_THEME=$(gsettings get org.gnome.desktop.interface icon-theme)
  [[ "$CURRENT_GTK_THEME" = "'Numix'" ]] && [[ "$CURRENT_ICON_THEME" = "'Numix-Circle'" ]]
}

install_numix_theme() {
  sudo add-apt-repository ppa:numix/ppa -y
  sudo apt update
  sudo apt install -y numix-gtk-theme numix-icon-theme-circle
}

postinstall_numix_theme() {
  gsettings set org.gnome.desktop.interface gtk-theme "Numix"
  gsettings set org.gnome.desktop.interface icon-theme "Numix-Circle"
}

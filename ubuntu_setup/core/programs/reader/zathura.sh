install_zathura() {
  sudo apt install -y zathura zathura-pdf-poppler zathura-djvu zathura-ps
}

postinstall_zathura() {
  xdg-mime default org.pwmt.zathura.desktop application/pdf
}

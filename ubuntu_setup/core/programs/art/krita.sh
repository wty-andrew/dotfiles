check_krita() {
  ls $APPLICATION_DOWNLOAD_PATH | grep -q krita
}

install_krita() {
  cd $APPLICATION_DOWNLOAD_PATH
  curl -OL https://download.kde.org/stable/krita/5.1.1/krita-5.1.1-x86_64.appimage
}

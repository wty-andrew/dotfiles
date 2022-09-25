check_lmms() {
  ls $APPLICATION_DOWNLOAD_PATH | grep -q lmms
}

install_lmms() {
  cd $APPLICATION_DOWNLOAD_PATH
  curl -OL https://github.com/LMMS/lmms/releases/download/v1.2.2/lmms-1.2.2-linux-x86_64.AppImage
}

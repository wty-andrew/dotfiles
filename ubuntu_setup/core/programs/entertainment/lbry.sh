check_lbry() {
  ls $APPLICATION_DOWNLOAD_PATH | grep -q -i lbry
}

install_lbry() {
  cd $APPLICATION_DOWNLOAD_PATH
  curl -OL https://github.com/lbryio/lbry-desktop/releases/download/v0.53.5/LBRY_0.53.5.AppImage
}

check_mendeley() {
  ls $APPLICATION_DOWNLOAD_PATH | grep -q mendeley
}

install_mendeley() {
  cd $APPLICATION_DOWNLOAD_PATH
  curl -LO https://static.mendeley.com/bin/desktop/mendeley-reference-manager-2.77.0-x86_64.AppImage
}

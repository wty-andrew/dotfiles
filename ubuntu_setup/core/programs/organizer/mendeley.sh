check_mendeley() {
  [[ -x "$(command -v mendeleydesktop)" ]]
}

install_mendeley() {
  cd $TEMPORARY_DOWNLOAD_PATH
  curl -Lo mendeley.deb https://www.mendeley.com/repositories/ubuntu/stable/amd64/mendeleydesktop-latest
  sudo gdebi -n mendeley.deb
}

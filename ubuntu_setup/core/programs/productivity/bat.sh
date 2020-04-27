install_bat() {
  cd $TEMPORARY_DOWNLOAD_PATH
  curl -OL https://github.com/sharkdp/bat/releases/download/v0.15.0/bat_0.15.0_amd64.deb
  sudo gdebi -n bat_0.15.0_amd64.deb
}

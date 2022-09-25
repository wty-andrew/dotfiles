install_zoom() {
  cd $TEMPORARY_DOWNLOAD_PATH
  curl -OL https://zoom.us/client/5.11.10.4400/zoom_amd64.deb
  sudo gdebi -n zoom_amd64.deb
}

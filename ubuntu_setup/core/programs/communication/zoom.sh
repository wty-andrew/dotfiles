install_zoom() {
  cd $TEMPORARY_DOWNLOAD_PATH
  curl -OL https://cdn.zoom.us/prod/5.13.11.1288/zoom_amd64.deb
  sudo gdebi -n zoom_amd64.deb
}

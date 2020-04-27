install_next() {
  cd $TEMPORARY_DOWNLOAD_PATH
  curl -O https://next.atlas.engineer/static/release/next_1.5_amd64.deb
  sudo gdebi -n next_1.5_amd64.deb
}

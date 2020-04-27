install_tagspaces() {
  cd $TEMPORARY_DOWNLOAD_PATH
  curl -OL https://www.tagspaces.org/downloads/tagspaces-amd64.deb
  sudo gdebi -n tagspaces-amd64.deb
}

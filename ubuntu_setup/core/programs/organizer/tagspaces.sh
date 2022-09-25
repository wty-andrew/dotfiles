install_tagspaces() {
  cd $TEMPORARY_DOWNLOAD_PATH
  curl -OL https://github.com/tagspaces/tagspaces/releases/download/v4.5.2/tagspaces-linux-amd64-4.5.2.deb
  sudo gdebi -n tagspaces-linux-amd64-4.5.2.deb
}

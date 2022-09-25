install_keybase() {
  cd $TEMPORARY_DOWNLOAD_PATH
  curl --remote-name https://prerelease.keybase.io/keybase_amd64.deb
  sudo gdebi -n keybase_amd64.deb
}

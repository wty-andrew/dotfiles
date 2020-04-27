check_chrome() {
  [[ -x "$(command -v google-chrome)" ]]
}

install_chrome() {
  cd $TEMPORARY_DOWNLOAD_PATH
  curl -O https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
  sudo gdebi -n google-chrome-stable_current_amd64.deb
}

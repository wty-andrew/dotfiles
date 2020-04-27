install_megasync() {
  local VERSION=$(lsb_release -r -s)
  cd $TEMPORARY_DOWNLOAD_PATH
  curl -O "https://mega.nz/linux/MEGAsync/xUbuntu_${VERSION}/amd64/megasync-xUbuntu_${VERSION}_amd64.deb"
  sudo gdebi -n megasync-xUbuntu_${VERSION}_amd64.deb
}

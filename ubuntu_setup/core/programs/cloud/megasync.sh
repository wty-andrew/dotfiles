install_megasync() {
  local VERSION=$(lsb_release -r -s)
  cd $TEMPORARY_DOWNLOAD_PATH
  curl -OL "https://mega.nz/linux/repo/xUbuntu_${VERSION}/amd64/megasync-xUbuntu_${VERSION}_amd64.deb"
  sudo gdebi -n megasync-xUbuntu_${VERSION}_amd64.deb
}

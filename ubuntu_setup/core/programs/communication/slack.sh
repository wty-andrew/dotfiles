install_slack() {
  cd $TEMPORARY_DOWNLOAD_PATH
  curl -OL https://downloads.slack-edge.com/releases/linux/4.29.149/prod/x64/slack-desktop-4.29.149-amd64.deb
  sudo gdebi -n slack-desktop-4.28.171-amd64.deb
}

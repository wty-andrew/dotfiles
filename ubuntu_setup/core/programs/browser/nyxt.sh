install_nyxt() {
  # check for new releases, see https://github.com/atlas-engineer/nyxt/issues/2468
  cd $TEMPORARY_DOWNLOAD_PATH
  curl -OL https://github.com/atlas-engineer/nyxt/releases/download/2.2.4/nyxt_2.2.4_amd64.deb
  sudo gdebi -n nyxt_2.2.4_amd64.deb
}

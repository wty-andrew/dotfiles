check_dropbox() {
  [[ -d $HOME/.dropbox-dist ]]
}

install_dropbox() {
  cd $TEMPORARY_DOWNLOAD_PATH
  cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
}

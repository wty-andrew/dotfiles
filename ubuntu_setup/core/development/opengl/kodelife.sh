check_kodelife() {
  [[ -f /opt/kodelife/KodeLife  ]]
}

install_kodelife() {
  cd $TEMPORARY_DOWNLOAD_PATH
  curl -OL https://hexler.net/pub/kodelife/kodelife-1.0.6.163-linux-x86_64.deb
  sudo gdebi -n kodelife-1.0.6.163-linux-x86_64.deb
}


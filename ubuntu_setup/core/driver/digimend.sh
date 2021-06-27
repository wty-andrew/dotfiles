check_digimend() {
  [[ -f /usr/share/X11/xorg.conf.d/50-digimend.conf ]]
}

install_digimend() {
  cd $TEMPORARY_DOWNLOAD_PATH
  curl -OL https://github.com/DIGImend/digimend-kernel-drivers/releases/download/v10/digimend-dkms_10_all.deb
  sudo gdebi -n digimend-dkms_10_all.deb
}


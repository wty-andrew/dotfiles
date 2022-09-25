install_emacs() {
  sudo apt install -y build-essential automake autoconf texinfo libx11-dev libgtk-3-dev libxpm-dev libjpeg-dev libpng-dev libgif-dev libtiff-dev libgccjit-11-dev libgnutls28-dev mailutils
  cd $SOURCE_CODE_DOWNLOAD_PATH
  git clone git://git.savannah.gnu.org/emacs.git -b emacs-28 && cd emacs
  make -j$(nproc)
  sudo make install
}

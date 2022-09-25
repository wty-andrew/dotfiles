install_stumpwm() {
  cd $HOME/quicklisp/local-projects
  git clone https://github.com/goose121/clx-truetype.git

  sbcl --quit \
    --eval '(ql:quickload "clx")' \
    --eval '(ql:quickload "cl-ppcre")' \
    --eval '(ql:quickload "alexandria")' \
    --eval '(ql:quickload "clx-truetype")'

  cd $SOURCE_CODE_DOWNLOAD_PATH
  git clone https://github.com/stumpwm/stumpwm.git && cd stumpwm
  ./autogen.sh
  ./configure
  make
  sudo make install
}

postinstall_stumpwm() {
  mkdir -p $HOME/.stumpwm.d
  git clone https://github.com/stumpwm/stumpwm-contrib ~/.stumpwm.d/modules

  sudo cp $FILES_DIR/stumpwm.desktop /usr/share/xsessions
}

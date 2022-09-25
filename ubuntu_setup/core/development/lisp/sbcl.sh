install_sbcl() {
  cd $TEMPORARY_DOWNLOAD_PATH
  curl -OL http://prdownloads.sourceforge.net/sbcl/sbcl-2.2.8-x86-64-linux-binary.tar.bz2
  tar -xf sbcl-2.2.8-x86-64-linux-binary.tar.bz2 -C $SOURCE_CODE_DOWNLOAD_PATH
  cd $SOURCE_CODE_DOWNLOAD_PATH/sbcl-2.2.8-x86-64-linux
  sudo sh install.sh
}

postinstall_sbcl() {
  cd $TEMPORARY_DOWNLOAD_PATH
  curl -O https://beta.quicklisp.org/quicklisp.lisp
  sbcl --quit --load quicklisp.lisp \
    --eval '(quicklisp-quickstart:install)' \
    --eval '(ql-dist:install-dist "http://dist.ultralisp.org/" :prompt nil)'
}

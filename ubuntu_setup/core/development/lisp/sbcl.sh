# next browser installs sbcl, so check quicklisp instead
check_sbcl() {
  [[ -d $HOME/quicklisp ]]
}

install_sbcl() {
  sudo apt install -y sbcl
}

postinstall_sbcl() {
  cd $TEMPORARY_DOWNLOAD_PATH
  curl -O https://beta.quicklisp.org/quicklisp.lisp
  sbcl --quit --load quicklisp.lisp \
    --eval '(quicklisp-quickstart:install)' \
    --eval '(ql-dist:install-dist "http://dist.ultralisp.org/" :prompt nil)'
}

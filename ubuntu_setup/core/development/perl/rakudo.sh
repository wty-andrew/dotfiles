check_rakudo() {
  [[ -x "$(command -v perl6)" ]]
}

install_rakudo() {
  cd $SOURCE_CODE_DOWNLOAD_PATH
  git clone https://github.com/rakudo/rakudo && cd rakudo
  perl Configure.pl --gen-moar --make-install --prefix $HOME/rakudo
}

postinstall_rakudo() {
  local header="# ===== Rakudo ====="
  local text=$(cat <<'EOF'
export PATH="$HOME/rakudo/bin:$HOME/rakudo/share/perl6/site/bin:$PATH"
EOF
)
  write_to_local_config "$header" "$text"

  cd $PERMANENT_DOWNLOAD_PATH
  git clone https://github.com/ugexe/zef && cd zef
  perl6 -Ilib bin/zef install .
}

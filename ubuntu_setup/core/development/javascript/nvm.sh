check_nvm() {
  [[ -d $HOME/.nvm ]]
}

install_nvm() {
  cd $TEMPORARY_DOWNLOAD_PATH
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
}

postinstall_nvm() {
  local header="# ===== NVM ====="
  local text=$(cat <<'EOF'
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
EOF
)
  write_to_local_config "$header" "$text"

  nvm install node
  nvm use node
  corepack enable
}

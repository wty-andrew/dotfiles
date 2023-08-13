install_go() {
  cd $TEMPORARY_DOWNLOAD_PATH
  curl -OL https://go.dev/dl/go1.20.7.linux-amd64.tar.gz
  sudo tar -C /usr/local -xzf go1.20.7.linux-amd64.tar.gz
}

postinstall_go() {
  local header="# ===== Golang ====="
  local text=$(cat <<'EOF'
export PATH="/usr/local/go/bin:$PATH"
export PATH="$PATH:$(go env GOPATH)/bin"
EOF
)
  write_to_local_config "$header" "$text"
}

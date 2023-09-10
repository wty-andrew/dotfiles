install_scala() {
  cd $TEMPORARY_DOWNLOAD_PATH
  curl -fL https://github.com/coursier/coursier/releases/latest/download/cs-x86_64-pc-linux.gz | gzip -d > cs && chmod +x cs && ./cs setup
}

postinstall_scala() {
  local header="# ===== Scala ====="
  local text=$(cat <<'EOF'
export PATH="$HOME/.local/share/coursier/bin:$PATH"
EOF
)
  write_to_local_config "$header" "$text"
}

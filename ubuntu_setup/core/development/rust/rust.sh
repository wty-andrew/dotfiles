check_rust() {
  [[ -x "$(command -v rustc)" ]]
}

install_rust() {
  curl https://sh.rustup.rs -sSf | sh -s -- -y
}

postinstall_rust() {
  local header="# ===== Rust ====="
  local text=$(cat <<'EOF'
source "$HOME/.cargo/env"
EOF
)
  write_to_local_config "$header" "$text"
}

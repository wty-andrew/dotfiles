check_deno() {
  [[ -d $HOME/.deno ]]
}

install_deno() {
  curl -fsSL https://deno.land/x/install/install.sh | sh
}

postinstall_deno() {
  local header="# ===== Deno ====="
  local text=$(cat <<'EOF'
export DENO_INSTALL="$HOME/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
EOF
)
  write_to_local_config "$header" "$text"
}

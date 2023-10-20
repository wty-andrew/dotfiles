check_fnm() {
  [[ -d $HOME/.fnm ]]
}

install_fnm() {
  curl -fsSL https://fnm.vercel.app/install | bash
}

postinstall_fnm() {
  local header="# ===== fnm ====="
  local text=$(cat <<'EOF'
export PATH=$HOME/.local/share/fnm:$PATH
eval "`fnm env`"
EOF
)
  write_to_local_config "$header" "$text"

  local latest=$(fnm list-remote | tail -n 1)
  fnm install $latest
  fnm default $latest
  corepack enable
  corepack prepare pnpm@latest --activate
}

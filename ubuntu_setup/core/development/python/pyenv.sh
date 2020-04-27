check_pyenv() {
  [[ -d $HOME/.pyenv ]]
}

install_pyenv() {
  sudo apt install -y \
    libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev \
    libncurses5-dev libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev
  curl https://pyenv.run | bash
}

postinstall_pyenv() {
  local header="# ===== pyenv ====="
  local text=$(cat <<'EOF'
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
if command -v pyenv &>/dev/null; then
  eval "$(pyenv init -)"
fi
if command -v pyenv-virtualenv &>/dev/null; then
  eval "$(pyenv virtualenv-init -)"
fi

EOF
)
  write_to_local_config "$header" "$text"
}

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
EOF
)
  write_to_local_config "$header" "$text"

  # register system python (taken from http://github.com/doloopwhile/pyenv-register)
  sudo apt install -y python3-virtualenv
  local venv=$(/usr/bin/python3 -c 'import sys; print("system-{}".format(".".join(map(str, sys.version_info[:3]))))')
  /usr/bin/python3 -m virtualenv -p /usr/bin/python3 --system-site-packages $HOME/.pyenv/versions/$venv
}

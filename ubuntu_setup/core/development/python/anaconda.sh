check_anaconda() {
  [[ -d $HOME/anaconda3  ]]
}

install_anaconda() {
  cd $TEMPORARY_DOWNLOAD_PATH
  curl -O https://repo.anaconda.com/archive/Anaconda3-2020.07-Linux-x86_64.sh
  bash Anaconda3-2020.07-Linux-x86_64.sh
}

postinstall_anaconda() {
  local header="# ===== Anaconda ====="
  local text=$(cat <<'EOF'
source $HOME/anaconda3/etc/profile.d/conda.sh
EOF
)
  write_to_local_config "$header" "$text"
}

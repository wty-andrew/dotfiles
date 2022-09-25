check_roswell() {
  [[ -x "$(command -v ros)" ]]
}

install_roswell() {
  cd $TEMPORARY_DOWNLOAD_PATH
  curl -OL https://github.com/roswell/roswell/releases/download/v21.10.14.111/roswell_21.10.14.111-1_amd64.deb
  sudo gdebi -n roswell_21.10.14.111-1_amd64.deb
}

postinstall_roswell() {
  local header="# ===== Roswell ====="
  local text=$(cat <<'EOF'
export PATH="$HOME/.roswell/bin:$PATH"
EOF
)
  write_to_local_config "$header" "$text"

  ros setup
  ros install sbcl-bin
}

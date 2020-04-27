check_musescore() {
  [[ -x "$(command -v musescore.mscore)" ]]
}

install_musescore() {
  sudo snap install musescore
}

check_vokoscreen_ng() {
  [[ -x "$(command -v vokoscreenNG)" ]]
}

install_vokoscreen_ng() {
  sudo apt install -y vokoscreen-ng
}


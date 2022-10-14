install_mpd() {
  sudo apt install -y mpd mpc ncmpcpp
}

postinstall_mpd() {
  mkdir -p $HOME/.mpd/playlists
  touch $HOME/.mpd/database
}

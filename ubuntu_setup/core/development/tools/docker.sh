install_docker() {
  sudo snap install docker
}

postinstall_docker() {
  sudo groupadd docker
  sudo usermod -aG docker $USER
}

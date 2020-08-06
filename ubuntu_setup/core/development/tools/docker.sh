install_docker() {
  cd $TEMPORARY_DOWNLOAD_PATH
  curl -fsSL https://get.docker.com -o get-docker.sh
  sudo sh get-docker.sh

  # docker-compose
  sudo curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
  sudo chmod +x /usr/local/bin/docker-compose
}

postinstall_docker() {
  sudo groupadd docker
  sudo usermod -aG docker $USER
}

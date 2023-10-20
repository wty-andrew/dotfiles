install_docker() {
  cd $TEMPORARY_DOWNLOAD_PATH
  curl -fsSL https://get.docker.com -o get-docker.sh
  sudo sh get-docker.sh

  # docker-compose
  sudo curl -SL https://github.com/docker/compose/releases/download/v2.20.2/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
  sudo chmod +x /usr/local/bin/docker-compose
}

postinstall_docker() {
  sudo usermod -aG docker $USER
}

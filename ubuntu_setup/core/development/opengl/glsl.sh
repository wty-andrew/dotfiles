check_glsl() {
  [[ -x "$(command -v glslViewer)" ]]
}

install_glsl() {
  sudo apt install -y glslang-tools
}

postinstall_glsl() {
  sudo add-apt-repository ppa:patriciogv/glslviewer-ppa -y
  sudo apt update
  sudo apt install -y glslviewer
}

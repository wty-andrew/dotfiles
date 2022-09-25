check_blender() {
  ls $APPLICATION_DOWNLOAD_PATH | grep -q blender
}

install_blender() {
  # snap doesn't allow install third-party dependencies (python packages)
  cd $TEMPORARY_DOWNLOAD_PATH
  curl -OL https://mirror.freedif.org/blender/release/Blender3.3/blender-3.3.0-linux-x64.tar.xz
  tar -xf blender-3.3.0-linux-x64.tar.xz -C $APPLICATION_DOWNLOAD_PATH
}

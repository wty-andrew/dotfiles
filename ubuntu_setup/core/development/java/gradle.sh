check_gradle() {
  [[ -d /opt/gradle ]]
}

install_gradle() {
  cd $TEMPORARY_DOWNLOAD_PATH
  curl -OL https://services.gradle.org/distributions/gradle-7.2-bin.zip
  sudo mkdir /opt/gradle
  sudo unzip -d /opt/gradle gradle-7.2-bin.zip
}

postinstall_roswell() {
  local header="# ===== Gradle ====="
  local text=$(cat <<'EOF'
export PATH=$PATH:/opt/gradle/gradle-7.2/bin
EOF
)
  write_to_local_config "$header" "$text"
}

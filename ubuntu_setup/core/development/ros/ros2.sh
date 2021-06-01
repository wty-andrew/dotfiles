check_ros2() {
  ROS_DISTRO_NAME=${ROS_DISTRO_NAME:="foxy"}
  [[ -d /opt/ros/$ROS_DISTRO_NAME  ]]
}

install_ros2() {
  ROS_DISTRO_NAME=${ROS_DISTRO_NAME:="foxy"}

  sudo apt update
  sudo apt install -y curl gnupg2 lsb-release
  sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key  -o /usr/share/keyrings/ros-archive-keyring.gpg

  echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null

  sudo apt update
  sudo apt install -y ros-$ROS_DISTRO_NAME-desktop
}

postinstall_ros2() {
  ROS_DISTRO_NAME=${ROS_DISTRO_NAME:="foxy"}

  local header="# ===== ROS2 ====="
  local text=$(cat <<EOF
source /opt/ros/$ROS_DISTRO_NAME/setup.zsh
source /opt/ros/$ROS_DISTRO_NAME/share/ros2cli/environment/ros2-argcomplete.zsh
source /usr/share/colcon_cd/function/colcon_cd.sh
source /usr/share/colcon_argcomplete/hook/colcon-argcomplete.zsh
EOF
)
  write_to_local_config "$header" "$text"

  sudo apt update
  sudo apt install -y python3-rosdep python3-argcomplete python3-colcon-common-extensions
  sudo rosdep init
  rosdep update
}

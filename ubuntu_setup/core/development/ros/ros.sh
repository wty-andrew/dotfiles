check_ros() {
  ROS_DISTRO_NAME=${ROS_DISTRO_NAME:="melodic"}
  [[ -d /opt/ros/$ROS_DISTRO_NAME  ]]
}

install_ros() {
  ROS_DISTRO_NAME=${ROS_DISTRO_NAME:="melodic"}

  sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
  sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
  sudo apt update
  sudo apt install -y ros-$ROS_DISTRO_NAME-desktop-full
}

postinstall_ros() {
  ROS_DISTRO_NAME=${ROS_DISTRO_NAME:="melodic"}

  local header="# ===== ROS ====="

  write_to_local_config "$header" "source /opt/ros/$ROS_DISTRO_NAME/setup.zsh"

  sudo apt install -y python-rosdep python-rosinstall python-rosinstall-generator python-wstool
  sudo rosdep init
  rosdep update
}

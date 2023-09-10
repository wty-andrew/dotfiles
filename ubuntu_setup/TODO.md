# C++

```bash
DOWNLOAD_DIR=$HOME/Source

function install_gtest_gmock {
  sudo apt install -y libgtest-dev libgmock-dev
}

function install_ceres_solver {
  # CMake, google-glog + gflags, BLAS and LAPACK, Eigen3, SuiteSparse and CXSparse (optional)
  sudo apt install -y cmake libgoogle-glog-dev libgflags-dev libatlas-base-dev libeigen3-dev libsuitesparse-dev

  cd $DOWNLOAD_DIR
  git clone https://ceres-solver.googlesource.com/ceres-solver && cd "$(basename $_)"
  mkdir build && cd build
  cmake ..
  make -j3
  # make test
  sudo make install
}
```

# JavaScript

```bash
npm i -g typescript ts-node
npm i -g parcel-bundler
npm i -g gatsby-cli
npm i -g yo generator-code
npm i -g gitmoji-cli
```

# ROS

```bash
ROS_DISTRO_NAME=${ROS_DISTRO_NAME:="noetic"}
IGNITION_VERSION=${IGNITION_VERSION:="citadel"}

function install_ignition {
  sudo sh -c 'echo "deb http://packages.osrfoundation.org/gazebo/ubuntu-stable `lsb_release -cs` main" > /etc/apt/sources.list.d/gazebo-stable.list'
  wget http://packages.osrfoundation.org/gazebo.key -O - | sudo apt-key add -
  sudo apt update
  sudo apt install -y ignition-$IGNITION_VERSION
}

sudo apt install -y ros-$ROS_DISTRO_NAME-ros-ign
sudo apt install -y ros-$ROS_DISTRO_NAME-rosemacs
```


# Python
```bash
# https://github.com/deoplete-plugins/deoplete-jedi/wiki/Setting-up-Python-for-Neovim#using-virtual-environments
pyenv install 3.8.5
pyenv virtualenv 3.8.5 neovim3
pyenv activate neovim3
pip install neovim

pyenv virtualenv 3.8.5 py38
pyenv activate py38

pip3 install virtualenv
git clone https://github.com/doloopwhile/pyenv-register.git $(pyenv root)/plugins/pyenv-register
pyenv register /usr/bin/python3
pyenv global system-3.8.2
pip3 install flake8 pylint mypy autopep8 black pytest sphinx pyyaml
```

# Jupyter
```bash
pip install jupyterlab ipympl
jupyter labextension install @jupyter-widgets/jupyterlab-manager
jupyter labextension install jupyter-matplotlib

jupyter labextension update --all
jupyter lab build
jupyter nbextension list
jupyter labextension list

# cling
conda create -n cling
conda activate cling
conda install xeus-cling -c conda-forge
conda install jupyter
```

ln -s $(which fdfind) ~/.local/bin/fd

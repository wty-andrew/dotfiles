#!/bin/bash

DOTFILES_ROOT=$HOME/dotfiles
LOCAL_CONFIG_FILE=$DOTFILES_ROOT/zsh/local.sh  # all program setups (ex: export ENV_VAR) will be written to this file
TEMPORARY_DOWNLOAD_PATH=/tmp
PERMANENT_DOWNLOAD_PATH=$HOME/Source
BACKUP_ROOT=$DOTFILES_ROOT/backup
FILES_DIR=$DOTFILES_ROOT/ubuntu_setup/customize/files
ROS_DISTRO_NAME=melodic

touch $LOCAL_CONFIG_FILE
mkdir -p $TEMPORARY_DOWNLOAD_PATH
mkdir -p $PERMANENT_DOWNLOAD_PATH
mkdir -p $BACKUP_ROOT


RED=$(tput setaf 9)
GREEN=$(tput setaf 40)
YELLOW=$(tput setaf 220)
CYAN=$(tput setaf 14)
RESET=$(tput sgr0)

info() { echo "${YELLOW}${@}${RESET}"; }
notice() { echo "${CYAN}${@}${RESET}"; }
success() { echo "${GREEN}${@}${RESET}"; }
error() { echo "${RED}${@}${RESET}" >&2; }

program_exists() {
  [[ -x "$(command -v $1)" ]]
}

function_exists() {
  [[ "$(type -t $1)" = 'function' ]]
}

try_command() {
  $1
  if [[ $? -ne 0 ]]; then
    error "\"$1\" failed" && return 1
  else
    success "\"$1\" success" && return 0
  fi
}

install() {
  if function_exists check_$1 && check_$1 || program_exists $1; then
    info "$1 already installed" && return 0
  fi

  info "Installing $1 ..."
  try_command install_$1 || return 1

  function_exists postinstall_$1 && try_command postinstall_$1 || return 1
}

# $1 = header, $2 = content
write_to_local_config() {
  grep -q "$1" $LOCAL_CONFIG_FILE && info "$1 found in local config, skipped" && return 0

cat <<EOF >> $LOCAL_CONFIG_FILE
$1
$2

EOF
  source $LOCAL_CONFIG_FILE
}

# $1 = source, $2 = dest
try_create_symlink() {
  if [[ -L "$2" ]]; then
    info "$2 already exists as a symbolic link, skipped" && return 0
  fi

  if [[ -e "$2" ]]; then
    local stamp=$(date +"%Y%m%d%H%M")
    local BACKUP_PATH="$BACKUP_ROOT/$(basename $2).$stamp"
    info "$2 exists, backing up to $BACKUP_PATH"
    mv $2 $BACKUP_PATH
  fi

  echo "Creating symlink $1 -> $2"
  ln -s $1 $2
}

setup() {
  try_command setup_$1 || return 1
}

#!/bin/bash

sudo -v

CWD=$(dirname "$(realpath $0)")

source "$CWD/helpers.sh"

notice "Change user directories to English"
LANG=C xdg-user-dirs-gtk-update

notice "General settings"
gsettings set org.gnome.desktop.input-sources xkb-options "['ctrl:nocaps']"
gsettings set org.gnome.shell.extensions.dash-to-dock click-action minimize
gsettings set org.gnome.mutter workspaces-only-on-primary false

notice "Update/Upgrade system packages"
sudo apt update && sudo apt upgrade -y

notice "Install common packages"
sudo apt install -y git curl wget tree unzip jq htop flameshot xclip
sudo apt install -y gdebi software-properties-common ca-certificates python-openssl
sudo apt install -y g++ gcc build-essential pkg-config make cmake autoconf llvm
sudo apt install -y python-dev python-pip python3-dev python3-pip
sudo apt install -y lightdm  # having some problems with login manager and fcitx with gdm3

cd $DOWNLOAD_PATH

for folder in system programs development; do
  notice "Setting up $folder..."

  for file in $(find "$CWD/core/$folder" -name '*.sh'); do
    source $file
    target=$(basename $file .sh)
    install $target
  done
done

notice "Done!"

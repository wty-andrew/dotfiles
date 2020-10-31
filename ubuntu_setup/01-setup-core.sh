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
gsettings set org.gnome.desktop.interface text-scaling-factor 1.25
gsettings set org.gnome.desktop.wm.keybindings activate-window-menu "[]"

notice "Update/Upgrade system packages"
sudo apt update && sudo apt upgrade -y

notice "Install common packages"
sudo apt install -y git curl wget tree unzip unrar jq htop flameshot xclip bat mlocate
sudo apt install -y gdebi software-properties-common ca-certificates
sudo apt install -y g++ gcc build-essential pkg-config make cmake autoconf llvm
sudo apt install -y python3-dev python3-pip
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

#!/bin/bash

sudo -v

CWD=$(dirname "$(realpath $0)")

source "$CWD/helpers.sh"

notice "Installing symlinks"
try_create_symlink $DOTFILES_ROOT/.zshrc $HOME/.zshrc
try_create_symlink $DOTFILES_ROOT/.zimrc $HOME/.zimrc
try_create_symlink $DOTFILES_ROOT/config/starship.toml $HOME/.config/starship.toml

try_create_symlink $DOTFILES_ROOT/config/git $HOME/.config/git
try_create_symlink $DOTFILES_ROOT/.gitconfig $HOME/.gitconfig

try_create_symlink $DOTFILES_ROOT/.editorconfig $HOME/.editorconfig

try_create_symlink $DOTFILES_ROOT/config/fontconfig $HOME/.config/fontconfig
try_create_symlink $DOTFILES_ROOT/.alacritty.yml $HOME/.alacritty.yml

try_create_symlink $DOTFILES_ROOT/stumpwm.d/init.lisp $HOME/.stumpwmrc
try_create_symlink $DOTFILES_ROOT/config/polybar $HOME/.config/polybar
try_create_symlink $DOTFILES_ROOT/nyxt $HOME/.config/nyxt
try_create_symlink $DOTFILES_ROOT/nvim $HOME/.config/nvim
try_create_symlink $DOTFILES_ROOT/.sbclrc $HOME/.sbclrc
try_create_symlink $DOTFILES_ROOT/config/zathura $HOME/.config/zathura
try_create_symlink $DOTFILES_ROOT/config/ranger $HOME/.config/ranger

try_create_symlink $DOTFILES_ROOT/.pylintrc $HOME/.pylintrc
try_create_symlink $DOTFILES_ROOT/config/yapf $HOME/.config/yapf
try_create_symlink $DOTFILES_ROOT/config/flake8 $HOME/.config/flake8
try_create_symlink $DOTFILES_ROOT/config/mypy $HOME/.config/mypy
try_create_symlink $DOTFILES_ROOT/config/tmux $HOME/.config/tmux
try_create_symlink $DOTFILES_ROOT/config/wezterm $HOME/.config/wezterm

try_create_symlink $DOTFILES_ROOT/config/mpd $HOME/.config/mpd
try_create_symlink $DOTFILES_ROOT/config/ncmpcpp $HOME/.config/ncmpcpp

try_create_symlink $DOTFILES_ROOT/.clang-format $HOME/.clang-format

for file in $(find "$CWD/customize" -maxdepth 1 -name '*.sh'); do
  source $file
  target=$(basename $file .sh)
  notice "Setting up $target..."
  setup $target
done

notice "Done!"

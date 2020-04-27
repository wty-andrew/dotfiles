#!/bin/bash

sudo -v

CWD=$(dirname "$(realpath $0)")

source "$CWD/helpers.sh"

notice "Installing symlinks"
try_create_symlink $DOTFILES_ROOT/.zshrc $HOME/.zshrc

try_create_symlink $DOTFILES_ROOT/config/git $HOME/.config/git
try_create_symlink $DOTFILES_ROOT/.gitconfig $HOME/.gitconfig

try_create_symlink $DOTFILES_ROOT/.editorconfig $HOME/.editorconfig

try_create_symlink $DOTFILES_ROOT/stumpwm.d/init.lisp $HOME/.stumpwmrc
try_create_symlink $DOTFILES_ROOT/next $HOME/.config/next
try_create_symlink $DOTFILES_ROOT/nvim $HOME/.config/nvim
try_create_symlink $DOTFILES_ROOT/.tmux.conf $HOME/.tmux.conf
try_create_symlink $DOTFILES_ROOT/.sbclrc $HOME/.sbclrc

try_create_symlink $DOTFILES_ROOT/.pylintrc $HOME/.pylintrc
try_create_symlink $DOTFILES_ROOT/config/yapf $HOME/.config/yapf
try_create_symlink $DOTFILES_ROOT/config/flake8 $HOME/.config/flake8
try_create_symlink $DOTFILES_ROOT/config/mypy $HOME/.config/mypy

for file in $(find "$CWD/customize" -maxdepth 1 -name '*.sh'); do
  source $file
  target=$(basename $file .sh)
  notice "Setting up $target..."
  setup $target
done

notice "Done!"

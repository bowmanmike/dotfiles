#! /usr/bin/env bash

# bash strict mode
set -euo pipefail

# bash function which accepts a file path and symlinks it
function symlink {
  # create ~/.config dir if it doesn't exist
  if [ ! -d ~/.config ]; then
    mkdir ~/.config
  fi

  local source=$1
  local destination=$2
  if [ -e $destination ]; then
    echo "$destination already exists, backing up and replacing"
    mv $destination $destination.bak
  fi

  ln -s $source $destination
}

symlink $(pwd)/.zshrc ~/.zshrc
symlink $(pwd)/.gitconfig ~/.gitconfig
symlink $(pwd)/.gitignore_global ~/.gitignore
symlink $(pwd)/nvim ~/.config/nvim
symlink $(pwd)/ghostty ~/.config/ghostty
symlink $(pwd)/.tmux.conf ~/.tmux.conf
# ln -s $(pwd)/.zshrc ~/.zshrc
# ln -s 

# determine current shell and set to zsh if not already
if [ $SHELL != "/bin/zsh" ]; then
  sudo chsh "$(id -un)" --shell "/usr/bin/zsh"
fi

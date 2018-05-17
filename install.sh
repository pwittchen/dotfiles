#!/usr/bin/env bash
set -e
sudo cp .gitconfig ~/
sudo cp .gitignore_global ~/
sudo cp .tmux.conf ~/
sudo cp .vimrc ~/
sudo cp .zshrc ~/
sudo cp .ghci ~/

# I'm using hybris config on macOS only

if [ `uname` = "Darwin"  ]; then
  sudo cp .hybris.conf ~/
fi

echo "dotfiles installed successfully! \o/"
echo "run source ~/.zshrc command manually to refresh your configuration"

#!/usr/bin/env bash
set -e
sudo cp .gitconfig ~/
sudo cp .gitignore_global ~/
sudo cp .hybris.conf ~/
sudo cp .tmux.conf ~/
sudo cp .vimrc ~/
sudo cp .zshrc ~/
sudo cp .ghci ~/
echo "dotfiles installed successfully! \o/"
echo "run source ~/.zshrc command manually to refresh your configuration"

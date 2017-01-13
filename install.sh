#!/usr/bin/env bash
set -e
# copy configuration files
sudo cp .gitconfig ~/
sudo cp .gitignore_global ~/
sudo cp .hybris.conf ~/
sudo cp .tmux.conf ~/
sudo cp .vimrc ~/
sudo cp .zshrc ~/
# copy scripts
sudo cp scripts/* /usr/local/bin/
# reload shell
source ~/.zshrc
echo "dotfiles installed successfully! \o/"

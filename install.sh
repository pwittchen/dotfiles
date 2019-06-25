#!/usr/bin/env bash
set -e
sudo cp .gitconfig ~/
sudo cp .gitignore_global ~/
sudo cp .tmux.conf ~/
sudo cp .vimrc ~/
sudo cp .zshrc ~/
sudo cp .ghci ~/
sudo rm -rf ~/.config/argos || true
sudo rm -rf ~/.scripts || true
mkdir ~/.config/argos
mkdir ~/.scripts
sudo cp -R .argos/* ~/.config/argos
sudo cp -R .scripts/* ~/.scripts

if [ ! -z $1  ] && [ $1 == "work" ]; then
  sudo rm ~/.config/argos/00_aqi.300s.sh || true
  sudo rm ~/.scripts/make_* -i || true
  echo "work setup done"
fi

echo "dotfiles installed successfully! \o/"
echo "run source ~/.zshrc command manually to refresh your configuration"

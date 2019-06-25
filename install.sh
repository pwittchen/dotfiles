#!/usr/bin/env bash
set -e

if [ ! -z $1 ] && [ $1 == "config" ]; then
  sudo mkdir ~/.config/scripts_backup || true
  sudo cp -R ~/.config/scripts/* ~/.config/scripts_backup || true
  sudo rm -rf ~/.config/scripts || true
  sudo mkdir -p ~/.config/scripts
  sudo cp -R .config/* ~/.config/scripts
  echo "empty config files created"
  exit 1
fi

if [ ! -z $1 ] && [ $1 == "restoreconfig" ]; then
  sudo cp -R ~/.config/scripts_backup/* ~/.config/scripts
  sudo rm -rf ~/.config/scripts_backup
  echo "backup config restored"
  exit 1
fi

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

if [ ! -z $1 ] && [ $1 == "work" ]; then
  sudo rm ~/.config/argos/00_aqi.300s.sh || true
  sudo rm ~/.scripts/make_* -i || true
  echo "work setup done"
fi

echo "dotfiles installed successfully! \o/"
echo "run source ~/.zshrc command manually to refresh your configuration"

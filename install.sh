#!/usr/bin/env bash
set -e

if [ ! -z $1 ] && [ $1 == "emptyconfig" ]; then
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

if [ ! -z $1 ] && [ $1 == "argos" ]; then
  sudo rm -rf ~/.config/argos || true
  mkdir ~/.config/argos
  sudo cp -R .argos/* ~/.config/argos
  echo "argos scripts copied"
fi

sudo rm -rf ~/.scripts || true
mkdir ~/.scripts
sudo cp -R .scripts/* ~/.scripts

if [ ! -z $1 ] && [ $1 == "work" ]; then
  sudo rm ~/.config/argos/00_aqi.300s.sh -f || true
  sudo rm ~/.scripts/make_backup_* -f || true
  sudo cp .config/enginiety.conf ~/.config/scripts/enginiety.conf
  source .config/enginiety.conf
  git config --global user.email $USER_EMAIL_WORK
  echo "work setup done"
else
  sudo rm ~/.scripts/play_* || true
fi

echo "dotfiles installed successfully! \o/"
echo "restart terminal or run commands below to refresh configs"
echo "run: source ~/.zshrc"
echo "run: tmux source-file ~/.tmux.conf"

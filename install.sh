#!/usr/bin/env bash
set -e

if [ ! -z $1 ] && [ $1 == "emptyconfig" ]; then
  sudo mkdir ~/.config/scripts_backup || true
  sudo cp -R ~/.config/scripts/* ~/.config/scripts_backup || true
  sudo rm -rf ~/.config/scripts || true
  sudo mkdir -p ~/.config/scripts
  sudo cp -R .config_templates/* ~/.config/scripts
  echo "empty config files created"
  exit 1
fi

if [ ! -z $1 ] && [ $1 == "restoreconfig" ]; then
  sudo cp -R ~/.config/scripts_backup/* ~/.config/scripts
  sudo rm -rf ~/.config/scripts_backup || true
  echo "backup config files restored"
  exit 1
fi

if [ ! -z $1 ] && [ $1 == "argos" ]; then
  sudo rm -rf ~/.config/argos || true
  mkdir ~/.config/argos
  sudo cp -R .argos/* ~/.config/argos
  echo "argos scripts installed"
  exit 1
fi

if [ ! -z $1 ] && [ $1 == "vim" ]; then
  sudo rm -rf ~/.vim || true
  mkdir -p ~/.vim/autoload ~/.vim/bundle
  curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
  git clone https://github.com/scrooloose/nerdtree ~/.vim/bundle/nerdtree
  git clone https://github.com/majutsushi/tagbar ~/.vim/bundle/tagbar
  git clone https://github.com/kien/ctrlp.vim ~/.vim/bundle/ctrlp
  git clone https://github.com/ervandew/supertab ~/.vim/bundle/supertab
  git clone https://github.com/jiangmiao/auto-pairs ~/.vim/bundle/auto-pairs
  git clone https://github.com/Kazark/vim-SimpleSmoothScroll ~/.vim/bundle/vim-SimpleSmoothScroll
  echo "pathogen and vim plugins installed"
  exit 1
fi

if [ ! -z $1 ] && [ $1 == "tmux" ]; then
  sudo rm -rf ~/.tmux || true
  mkdir -p ~/.tmux/plugins
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  git clone https://github.com/tmux-plugins/tmux-sidebar ~/.tmux/plugins/tmux-sidebar
  git clone https://github.com/tmux-plugins/tmux-copycat ~/.tmux/plugins/tmux-copycat
  git clone https://github.com/tmux-plugins/tmux-pain-control ~/.tmux/plugins/tmux-pain-control
  git clone https://github.com/pwittchen/tmux-plugin-battery ~/.tmux/plugins/tmux-plugin-battery
  git clone https://github.com/pwittchen/tmux-plugin-cpu ~/.tmux/plugins/tmux-plugin-cpu
  git clone https://github.com/pwittchen/tmux-plugin-ram ~/.tmux/plugins/tmux-plugin-ram
  git clone https://github.com/pwittchen/tmux-plugin-uptime ~/.tmux/plugins/tmux-plugin-uptime
  echo "tpm and tmux plugins installed"
  echo "type Ctrl+B + I to reload tmux plugins in terminal"
  exit 1
fi

# main install process starts from here

sudo cp .gitconfig ~/
sudo cp .gitignore_global ~/
sudo cp .tmux.conf ~/
sudo cp .vimrc ~/
sudo cp .zshrc ~/
sudo cp .ghci ~/

sudo rm -rf ~/.scripts || true
mkdir ~/.scripts
sudo cp -R .scripts/* ~/.scripts

if [ ! -z $1 ] && [ $1 == "work" ]; then
  sudo cp .config_templates/enginiety.conf ~/.config/scripts/enginiety.conf
  source ~/.config/scripts/enginiety.conf
  git config --global user.email $USER_EMAIL_WORK
  sudo rm ~/.scripts/make_backup_*
  sudo rm ~/.scripts/android_*
  sudo rm ~/.scripts/ssh_linuxpl.sh
  sudo rm ~/.scripts/datelog.sh
  sudo head --lines=-3 ~/.scripts/aliases.sh > ~/.scripts/aliases_new.sh
  sudo rm ~/.scripts/aliases.sh
  sudo mv ~/.scripts/aliases_new.sh ~/.scripts/aliases.sh
  sudo chmod +x ~/.scripts/aliases.sh
  echo "work setup done"
else
  sudo rm ~/.scripts/play_* || true
fi

if [ `uname` != "Darwin" ]; then
  sudo rm ~/.scripts/apple_* || true
fi

echo "dotfiles installed successfully! \o/"
echo "restart terminal or run commands below to refresh configs"
echo "run: source ~/.zshrc"
echo "run: tmux source-file ~/.tmux.conf"

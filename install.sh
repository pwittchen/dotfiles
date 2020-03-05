#!/usr/bin/env bash
set -e

################################################
# parametrized installation utilities go first #
################################################

if [ ! -z $1 ] && [ $1 == "help" ]; then
  echo "
    install.sh script installs dotfiles from this repo
    running script without parameters will install default doftiles
    to install custom stuff, use one of the parameters below

    shows help                            help
    generating empty configs              emptyconfig
    restoring old/last configs            restorelastconfig
    installing tpm and tmux plugins       tmux
    installing pathogen and vim plugins   vim
    installing i3 config                  i3"
  exit 1
fi

if [ ! -z $1 ] && [ $1 == "emptyconfig" ]; then
  sudo mkdir ~/.config/scripts_backup || true
  sudo cp -R ~/.config/scripts/* ~/.config/scripts_backup || true
  sudo rm -rf ~/.config/scripts || true
  sudo mkdir -p ~/.config/scripts
  sudo cp -R .config/scripts/* ~/.config/scripts
  echo "empty config files created"
  exit 1
fi

if [ ! -z $1 ] && [ $1 == "restorelastconfig" ]; then
  sudo cp -R ~/.config/scripts_backup/* ~/.config/scripts
  sudo rm -rf ~/.config/scripts_backup || true
  echo "backup of the last config files restored"
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
  git clone https://github.com/junegunn/goyo.vim.git ~/.vim/bundle/goyo.vim
  git clone https://github.com/samoshkin/vim-mergetool.git ~/.vim/bundle/vim-mergetool
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

if [ ! -z $1 ] && [ $1 == "i3" ]; then
  sudo cp .config/i3/config ~/.config/i3/
  sudo cp .config/i3status/config ~/.config/i3status/config
  sudo cp .config/dunst/dunstrc ~/.config/dunst/dunstrc
fi

#########################################
# main install process starts from here #
#########################################

sudo cp .gitconfig ~/
sudo cp .gitignore_global ~/
sudo cp .tmux.conf ~/
sudo cp .vimrc ~/
sudo cp .zshrc ~/
sudo cp .ghci ~/
sudo cp .p10k.zsh ~/

sudo rm -rf ~/.scripts || true
mkdir ~/.scripts
sudo cp -R .scripts/* ~/.scripts

if [ `uname` != "Darwin" ]; then
  sudo rm ~/.scripts/apple_* || true
  echo "linux setup done"
else
  echo "apple/macos setup done"
fi

echo "dotfiles installed successfully! \o/"
echo "please, restart your terminal"

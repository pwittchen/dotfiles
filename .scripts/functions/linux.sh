#!/usr/bin/env bash

alias mc="mc -S nicedark"
alias tsm="transmission-remote"

export PATH='/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin':"$PATH"

function pbcopy() {
  xsel --clipboard --input
}

function pbpaste() {
  xsel --clipboard --output
}

function fuzzy_search_and_run() {
  cd $1
  fzf_out=$(fzf)
  if [ "$fzf_out" != "" ]; then
    sudo $2 $fzf_out
  fi
  cd -
}

function search_scripts() {
  fuzzy_search_and_run ~/.scripts vim
}

function clear_wallpapers() {
  sudo rm -rf $HOME/.cache/gnome-control-center/backgrounds/*
}

function set_wallpaper_with_path() {
  if [ $# -eq 0 ]; then
    echo "no argument with path to the picture supplied"
  else
    gsettings set org.gnome.desktop.background picture-uri $1
  fi
}

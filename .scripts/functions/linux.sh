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

function empty_trash() {
  rm -rf ~/.local/share/Trash/*
}

function dir_size() {
  du -sh $1
}

function fuzzy_searchAndRun() {
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

function search_docs() {
  fuzzy_search_and_run ~/Dokumenty libreoffice
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

function show_ip() {
  # get ip of wlan
  no_of_broadcasts="$(ifconfig | grep broadcast | wc -l)"
  if [ $no_of_broadcasts = "2" ]; then
    ip="$(ifconfig | grep broadcast | awk '{print $2}' | tail -n1)"
  fi
  if [ ! -z "$ip" ]; then
    echo "$ip"
  else
    # get ip of eth
    ip="$(ifconfig | grep ether | awk '{print $2}')"
    if [[ $ip != *"."* ]]; then
      ip=""
    fi
    if [ ! -z "$ip" ]; then
      echo "$ip"
    else
      echo "not connected"
    fi
  fi
}

function show_mac() {
  device=$(ifconfig -s | tail -n1 | awk '{print $1}')
  ip -o link show dev $device | awk '{print $17}'
}

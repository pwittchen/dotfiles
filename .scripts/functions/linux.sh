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

function emptyTrash() {
  rm -rf ~/.local/share/Trash/*
}

function dirSize() {
  du -sh $1
}

function fuzzySearchAndRun() {
  cd $1
  fzf_out=$(fzf)
  if [ "$fzf_out" != "" ]; then
    sudo $2 $fzf_out
  fi
  cd -
}

function searchScripts() {
  fuzzySearchAndRun ~/.scripts vim
}

function searchDocs() {
  fuzzySearchAndRun ~/Dokumenty libreoffice
}

function clearWallpapers() {
  sudo rm -rf $HOME/.cache/gnome-control-center/backgrounds/*
}

function setGnomeDesktopWallpaperWithPath() {
  if [ $# -eq 0 ]; then
    echo "no argument with path to the picture supplied"
  else
    gsettings set org.gnome.desktop.background picture-uri $1
  fi
}

function showIp() {
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

function showMac() {
  device=$(ifconfig -s | tail -n1 | awk '{print $1}')
  ip -o link show dev $device | awk '{print $17}'
}

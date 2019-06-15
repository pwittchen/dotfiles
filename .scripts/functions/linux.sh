#!/usr/bin/env bash

alias mc="mc -S nicedark"
alias tsm="transmission-remote"

function pbcopy() {
  xsel --clipboard --input
}

function pbpaste() {
  xsel --clipboard --output
}

function emptyTrash() {
  rm -rf ~/.local/share/Trash/*
}

function clearGnomeDesktopWallpapersCache() {
  sudo rm -rf $HOME/.cache/gnome-control-center/backgrounds/*
}

function setGnomeDesktopWallpaperWithPath() {
  if [ $# -eq 0 ]; then
    echo "no argument with path to the picture supplied"
  else
    gsettings set org.gnome.desktop.background picture-uri $1
  fi
}

function listCpuIntensivePs() {
  ps axch -o cmd:15,%cpu --sort=-%cpu | head
}

function listMemoryIntensivePs() {
  ps axch -o cmd:15,%mem --sort=-%mem | head
}

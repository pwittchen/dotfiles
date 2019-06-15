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
  gsettings set org.gnome.desktop.background picture-uri $1
}

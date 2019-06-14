#!/usr/bin/env bash

function pbcopy() {
  xsel --clipboard --input
}

function pbpaste() {
  xsel --clipboard --output
}

function clearGnomeDesktopBgs() {
  sudo rm -rf $HOME/.cache/gnome-control-center/backgrounds/*
}

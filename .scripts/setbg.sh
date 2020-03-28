#!/usr/bin/env bash

function setbg {
  cp $1 ~/.config/wall.jpg
  feh --bg-scale ~/.config/wall.jpg
  notify-send "wallpaper changed"
}

function help {
    echo "
    setbg.sh is a simple script for setting wallpapers

    usage:

    setbg.sh <filename>    sets given filename (*.jpg or *.png) as a wallpaper
    "
}

function main {
  if [ -z "$1" ] || [ "$1" == "help" ] ; then
    help
    exit
  fi
  if [[ "$1" == *".jpg"* ]] || [[ "$1" == *".png"* ]] ; then
    setbg $1
    exit
  fi
}

main "$@"

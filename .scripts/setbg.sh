#!/usr/bin/env bash

function setbg {
  cp $1 ~/.config/wall.jpg
  feh --bg-scale ~/.config/wall.jpg
  notify-send "wallpaper changed"
}

function setrandombg {
  if [ -z "$1" ] ; then
    dir=$(ls -d ~/pictures/wallpapers/*/ | shuf | head -n1)
  else
    dir=$1/
  fi
  file=$(ls $dir | shuf | head -n1)
  setbg $dir$file
}

function help {
    echo "
    setbg.sh is a simple script for setting wallpapers

    usage:

    setbg.sh <filename>    sets given filename (*.jpg or *.png) as a wallpaper
    setbg.sh random        sets random wallpaper
    setbg.sh random <dir>  sets random wallpaper from files in given dir
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
  if [ "$1" == "random" ] ; then
    setrandombg $2
    exit
  fi
}

main "$@"

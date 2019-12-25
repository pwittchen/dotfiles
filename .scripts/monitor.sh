#!/usr/bin/env bash

function list {
  xrandr --listmonitors
}

function laptopoff {
  xrandr --output eDP-1 --off
}

function laptopmirror {
  xrandr --output eDP-1 --mode 1920x1080 --output HDMI-2 --mode 1920x1080 --same-as eDP-1
}

function reset {
  xrandr --auto
}

function wallreload {
  feh --bg-scale ~/Pictures/wallpapers/mountains/bw-mountain-clouds.jpg
}

function main {
  if [ -z "$1" ] ; then
    exit
  fi
  if [ "$1" == "list" ]; then
    list
    exit
  fi
  if [ "$1" == "laptopoff" ]; then
    laptopoff
    exit
  fi
  if [ "$1" == "laptopomirror" ]; then
    laptopmirror
    exit
  fi
  if [ "$1" == "reset" ]; then
    reset
    exit
  fi
  if [ "$1" == "wallreload" ]; then
    wallreload
    exit
  fi

}

main "$@"

#!/usr/bin/env bash

function laptop {
  cp ~/.config/wall_laptop_monitor.png ~/.config/wall.png
  cp ~/.config/wall_laptop_monitor_lock.png ~/.cache/i3lock/current/l_resized.png  
  feh --bg-scale ~/.config/wall.png
}

function monitor {
  cp ~/.config/wall_external_monitor.png ~/.config/wall.png
  cp ~/.config/wall_external_monitor_lock.png ~/.cache/i3lock/current/l_resized.png
  feh --bg-scale ~/.config/wall.png
}

function help {
    echo "
    wallpaper.sh is a simple script for setting wallpaper and lock screen for laptop or external monitor 

    usage:

    help            shows help
    laptop          sets wallpaper and lock screen for laptop
    monitor         sets wallpaper and lock screen for external monitor 
    "
}

function main {
  if [ -z "$1" ] || [ "$1" == "help" ] ; then
    help
    exit
  fi
  if [ "$1" == "laptop" ]; then
    laptop
    exit
  fi
  if [ "$1" == "monitor" ]; then
    monitor
    exit
  fi
}

main "$@"

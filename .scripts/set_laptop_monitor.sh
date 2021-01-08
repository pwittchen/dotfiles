#!/usr/bin/env bash

if [ $(xrandr --listmonitors | wc -l) -eq 2 ]; then # run instructions only when no external monitor is connected
  xrandr --auto # reset default settings
  sleep 2 # without it sometimes script didn't work on startup after login
  cp ~/.config/wall_laptop_monitor.png ~/.config/wall.png # copy appropriate wallaper
  cp ~/.config/wall_laptop_monitor_lock.png ~/.cache/i3lock/current/l_resized.png # set appropriate lock screen
  feh --bg-scale ~/.config/wall.png # reload wallpaper to adjust it to the screen size
fi

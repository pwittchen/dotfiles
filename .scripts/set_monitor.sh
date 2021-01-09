#!/usr/bin/env bash

# setup for laptop screen

if [ $(xrandr --listmonitors | wc -l) -eq 2 ]; then # run instructions only when no external monitor is connected
  xrandr --auto # reset default settings
  sleep 2 # without it sometimes script didn't work on startup after login
  cp ~/.config/wall_laptop_monitor.png ~/.config/wall.png # copy appropriate wallaper
  cp ~/.config/wall_laptop_monitor_lock.png ~/.cache/i3lock/current/l_resized.png # set appropriate lock screen
  feh --bg-scale ~/.config/wall.png # reload wallpaper to adjust it to the screen size
fi

# setup for external connected screeen

if [ $(xrandr --listmonitors | wc -l) -eq 3 ]; then # run instructions only when external monitor is connected
  xrandr --output eDP-1 --off # turn off the primary (laptop) monitor
  i3-msg "workspace 1" # switch to the workspace 1 (secondary monitor is on the workspace 2 in the beginning)
  sleep 2 # without it sometimes script didn't work on startup after login
  cp ~/.config/wall_external_monitor.png ~/.config/wall.png # copy appropriate wallaper
  cp ~/.config/wall_external_monitor_lock.png ~/.cache/i3lock/current/l_resized.png # set appropriate lock screen
  feh --bg-scale ~/.config/wall.png # reload wallpaper to adjust it to the screen size
fi

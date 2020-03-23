#!/usr/bin/env bash

if [ $(xrandr --listmonitors | wc -l) -eq 3 ]; then
  xrandr --output eDP-1 --off
  i3-msg "workspace 1"
  sleep 2 # without it sometimes script didn't work on startup after login
  feh --bg-scale ~/Pictures/config/wallpaper/wallpaper.jpg
fi

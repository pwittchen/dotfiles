#!/usr/bin/env bash

if [ $(xrandr --listmonitors | wc -l) -eq 3 ]; then
  xrandr --output eDP-1 --off
  feh --bg-scale ~/Pictures/config/wallpaper/wallpaper.jpg
  i3-msg "workspace 1"
fi

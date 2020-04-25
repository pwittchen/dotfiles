#!/usr/bin/env bash

if [ $(xrandr --listmonitors | wc -l) -eq 3 ]; then # run instructions only when external monitor is connected
  xrandr --output eDP-1 --off # turn off the primary (laptop) monitor
  i3-msg "workspace 1" # switch to the workspace 1 (secondary monitor is on the workspace 2 in the beginning)
  sleep 2 # without it sometimes script didn't work on startup after login
  feh --bg-scale ~/.config/wall.jpg
fi

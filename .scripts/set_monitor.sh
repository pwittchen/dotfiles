#!/usr/bin/env bash

current_setup=$(cat ~/.config/.wall)

xrandr --auto # reset default settings

if [ $(xrandr --listmonitors | wc -l) -eq 2 ]; then # run instructions only when one monitor is active

  if [ "$current_setup" == "laptop" ]; then
    exit # only laptop screen is active and laptop setup is active -> no need to do anything
  fi

  # setup laptop screeen

  sleep 2 # without it sometimes script didn't work on startup after login
  cp ~/.config/wall_laptop_monitor.png ~/.config/wall.png # copy appropriate wallaper
  cp ~/.config/wall_laptop_monitor_lock.png ~/.cache/i3lock/current/l_resized.png # set appropriate lock screen
  feh --bg-scale ~/.config/wall.png # reload wallpaper to adjust it to the screen size
  echo "laptop" > ~/.config/.wall
fi

# setup for external connected screeen and turn off the laptop screen (when at least two screens are connected)

if [ $(xrandr --listmonitors | wc -l) -eq 3 ]; then # run instructions only when external monitor is connected
  if [ "$current_setup" == "external" ]; then
    xrandr --output eDP-1 --off # turn off the primary (laptop) monitor
    exit; # external monitor setup is already active, no need to do anything
  fi

  # setup external monitor

  i3-msg "workspace 1" # switch to the workspace 1 (secondary monitor is on the workspace 2 in the beginning)
  sleep 2 # without it sometimes script didn't work on startup after login
  cp ~/.config/wall_external_monitor.png ~/.config/wall.png # copy appropriate wallaper
  cp ~/.config/wall_external_monitor_lock.png ~/.cache/i3lock/current/l_resized.png # set appropriate lock screen
  feh --bg-scale ~/.config/wall.png # reload wallpaper to adjust it to the screen size
  echo "external" > ~/.config/.wall
fi

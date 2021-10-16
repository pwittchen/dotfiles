#!/usr/bin/env bash

# this script describes monitor setup specific for my own personal environment
# basically, I want to disable laptop screen when external monitor is connected
# via usb-C and is charging battery at the same time
# and set wallpaper and lock screen background with appropriate resolution
# for external monitor or laptop screen
# I also want to avoid additional reload of the settings when it's not needed

current_setup=$(cat ~/.config/.monitor)
ac_connected=$(acpi -a | awk '{print $3}')

# preconditions to check if we have to reconfigure anything

if [ $(xrandr --listmonitors | wc -l) == "2" ]; then # run instructions only when one monitor is active
  if [ $(xrandr --listmonitors | grep 3440 | wc -l) == "1" ]; then
    if [ "$current_setup" == "external" ]; then
      if [ "$ac_connected" == "on-line" ]; then
        exit # external monitor is on, ac is on and setup is external
      fi
    fi
  fi

  if [ $(xrandr --listmonitors | grep 1920 | wc -l) == "1" ]; then
    if [ "$current_setup" == "laptop" ]; then
      if [ "$ac_connected" == "off-line" ]; then
        exit # laptop monitor is on, ac is off and setup is laptop
      fi
    fi
  fi
fi

xrandr --auto # reset default settings

if [ $(xrandr --listmonitors | wc -l) == "1" ]; then # run instructions only when one monitor is active
  if [ "$current_setup" == "laptop" ]; then
    exit # only laptop screen is active and laptop setup is active -> no need to do anything
  fi

  # setup laptop screeen

  cp ~/.config/wall_laptop_monitor.png ~/.config/wall.png # copy appropriate wallaper
  cp ~/.config/wall_laptop_monitor_lock.png ~/.cache/i3lock/current/l_resized.png # set appropriate lock screen
  feh --bg-scale ~/.config/wall.png # reload wallpaper to adjust it to the screen size
  echo "laptop" > ~/.config/.monitor
fi

# setup for external connected screeen and turn off the laptop screen (when at least two screens are connected)

if [ $(xrandr --listmonitors | wc -l) == "2" ]; then # run instructions only when external monitor is connected
  if [ "$current_setup" == "external" ]; then
    xrandr --output eDP-1 --off # turn off the primary (laptop) monitor
    feh --bg-scale ~/.config/wall.png # reload wallpaper to adjust it to the screen size
    i3-msg "workspace 1" # switch to the workspace 1 (secondary monitor is on the workspace 2 in the beginning)
    exit; # external monitor setup is already active, no need to do anything
  fi

  # setup external monitor

  cp ~/.config/wall_external_monitor.png ~/.config/wall.png # copy appropriate wallaper
  cp ~/.config/wall_external_monitor_lock.png ~/.cache/i3lock/current/l_resized.png # set appropriate lock screen
  xrandr --output eDP-1 --off # turn off the primary (laptop) monitor
  feh --bg-scale ~/.config/wall.png # reload wallpaper to adjust it to the screen size
  i3-msg "workspace 1" # switch to the workspace 1 (secondary monitor is on the workspace 2 in the beginning)
  echo "external" > ~/.config/.monitor
fi

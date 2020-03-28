#!/usr/bin/env bash

cp $1 ~/.config/wall.jpg
feh --bg-scale ~/.config/wall.jpg
notify-send "wallpaper changed"

#!/usr/bin/env bash
~/.scripts/set_bg.sh daynight ~/.config/wall_01.jpg ~/.config/wall_02.jpg ~/.config/wall_03.jpg ~/.config/wall_04.jpg
sleep 1
/usr/bin/rm -rf ~/.cache/i3lock/current/*
/usr/bin/betterlockscreen -u ~/.config/wall.jpg

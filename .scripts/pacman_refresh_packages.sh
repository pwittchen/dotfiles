#!/usr/bin/env bash
new_packages=$(pacman -Qu | wc -l)
echo $new_packages > /var/log/scripts/pacman_new_packages.log
[ $new_packages != "0" ] && DISPLAY=:0.0 notify-send "pacman" "downloaded $new_packages packages"

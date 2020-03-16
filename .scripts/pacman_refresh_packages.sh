#!/usr/bin/env bash
/usr/bin/pacman -Qu | /usr/bin/wc -l > /var/log/scripts/pacman_new_packages.log

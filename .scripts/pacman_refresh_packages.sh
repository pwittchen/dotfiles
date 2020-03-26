#!/usr/bin/env bash
pacman -Qu | wc -l > /var/log/scripts/pacman_new_packages.log

#!/usr/bin/env bash

pkgs_count=$(pacman -Qu | wc -l)
echo "U: $pkgs_count"

echo "---"

pacman -Qu | head

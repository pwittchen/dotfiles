#!/usr/bin/env bash

pkgs_count=$(pacman -Qu | wc -l)
echo "📦 $pkgs_count"

echo "---"

pacman -Qu

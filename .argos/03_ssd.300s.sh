#!/usr/bin/env bash
disk_used_percentage=$(df -Th | grep ^/dev/n | awk '{print $6}' | rev | cut -c 2- | rev | paste -sd+ | bc)
echo "SSD $disk_used_percentage%"
echo "---"
echo "disk usage:"
df -Th | grep ^/dev/n

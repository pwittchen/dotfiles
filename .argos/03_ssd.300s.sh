#!/usr/bin/env bash
disk_used_percentage=$(df -Th | grep ^/dev/n | awk '{print $6}' | rev | cut -c 2- | rev | paste -sd+ | bc)

if [ $(cat /sys/block/n*/queue/rotational) == "0" ]; then
  disk_type="SSD"
else
  disk_type="HDD"
fi

echo "$disk_type $disk_used_percentage%"
echo "---"
echo "disk usage:"
df -Th | grep ^/dev/n

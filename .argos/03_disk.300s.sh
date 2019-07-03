#!/usr/bin/env bash
disk_used_percentage_home=$(df -Th | grep ^/dev/nvme0n1p4 | awk '{print $6}')
disk_used_percentage_root=$(df -Th | grep ^/dev/nvme0n1p3 | awk '{print $6}')

if [ $(cat /sys/block/n*/queue/rotational) == "0" ]; then
  disk_type="SSD"
else
  disk_type="HDD"
fi

echo "$disk_type (home: $disk_used_percentage_home, root: $disk_used_percentage_root)"
echo "---"
echo "disk usage:"
df -Th | grep ^/dev/n

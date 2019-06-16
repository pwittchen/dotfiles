#!/usr/bin/env bash
disk_used_percentage=$(df | tail -n 1 | awk '{print $5}')
disk_used_bytes=$(df | tail -n 1 | awk '{print $3}')
disk_used_gb=`echo ${disk_used_bytes} / 1000000 | bc -l | cut -f1 -d"."`
disk_free_bytes=$(df | tail -n 1 | awk '{print $4}')
disk_free_gb=`echo ${disk_free_bytes} / 1000000 | bc -l | cut -f1 -d"."`
disk_capacity_gb=$[disk_used_gb+disk_free_gb]

echo "SSD $disk_used_percentage"
echo "---"
echo "disk usage:"
echo "$disk_used_gb GB / $disk_capacity_gb GB"
echo "excluding boot partition"

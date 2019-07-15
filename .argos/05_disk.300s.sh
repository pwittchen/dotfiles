#!/usr/bin/env bash
used=$(df -hT -BG -t ext4 -t vfat | sed "1 d" | awk '{print $4}' | rev | cut -c2- | rev | paste -sd+ - | bc) 
size=$(df -hT -BG -t ext4 -t vfat | sed "1 d" | awk '{print $3}' | rev | cut -c2- | rev | paste -sd+ - | bc)
echo "$used / $size" | bc -l | colrm 4 | sed 's/\.//g' | awk '{print "💽 " $1"%"}'

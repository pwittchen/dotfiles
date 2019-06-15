#!/usr/bin/env bash
disk_usage=$(df | tail -n 1 | awk '{print $5}')
echo "SSD $disk_usage"

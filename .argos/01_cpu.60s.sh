#!/usr/bin/env bash
cpu_usage=$(mpstat | awk '$12 ~ /[0-9.]+/ { print 100 - $12"%" }')
cpu_temp=$(sensors | grep Package | awk '{print $4}')
echo "CPU $cpu_usage ($cpu_temp)"

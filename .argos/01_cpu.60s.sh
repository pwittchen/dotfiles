#!/usr/bin/env bash
cpu_usage=$(mpstat | awk '$12 ~ /[0-9.]+/ {print 100 - $12"%"}')
cpu_temp=$(sensors | awk '/^Package/ {print $4}')
echo "CPU $cpu_usage ($cpu_temp)"
echo "---"
echo "use most of CPU:"
ps axch -o cmd:15,%cpu --sort=-%cpu | head

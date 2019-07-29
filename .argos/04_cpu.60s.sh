#!/usr/bin/env bash
if [ ! -z $(command -v mpstat) ]; then
  cpu_usage=$(mpstat | awk '$12 ~ /[0-9.]+/ {print 100 - $12"%"}' | cut -f1 -d".")
fi
if [ ! -z $(command -v sensors) ]; then
  cpu_temp=$(sensors | awk '/^Package/ {print $4}')
fi
if [ ! -z $cpu_temp ]; then
  echo "CPU: $cpu_usage ($cpu_temp)"
else
  echo "CPU: $cpu_usage"
fi
echo "---"
echo "use most of CPU:"
ps axch -o cmd:15,%cpu --sort=-%cpu | head

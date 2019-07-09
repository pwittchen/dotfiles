#!/usr/bin/env bash

function getRamUsage() {
  ramUsage=$(free -m | grep $memKeyword | awk '{print $3/$2 * 100}' | cut -f1 -d".")
}

memKeyword="Mem"
getRamUsage

if [ -z "$ramUsage" ]; then
  memKeyword="Pam"
  getRamUsage
fi

echo "📟 $ramUsage%"
echo "---"
echo "use most of RAM:"
ps axch -o cmd:15,%mem --sort=-%mem | head

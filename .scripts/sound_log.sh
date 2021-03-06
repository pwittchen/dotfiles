#!/usr/bin/env bash

function get_mac {
  bluetoothctl devices | grep "$1" | awk '{print $2}'
}

function is_connected {
  bluetoothctl info $1 | grep Connected | awk '{print $2}'
}

speaker_mac=$(get_mac "JBL Charge 3")
headphones_mac=$(get_mac "MOMENTUM TW")

if [ "$(is_connected $speaker_mac)" == "yes" ]; then
  echo "S" > /var/log/scripts/sound.log
elif [ "$(is_connected $headphones_mac)" == "yes" ]; then
  echo "H" > /var/log/scripts/sound.log
else
  echo "" > /var/log/scripts/sound.log
fi

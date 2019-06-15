#!/usr/bin/env bash

function get_ip_wlan() {
    ip="$(ifconfig | grep broadcast | awk '{print $2}' | tail -n1)"
}

function get_ip_eth() {
    ip="$(ifconfig | grep ether | awk '{print $2}')"
    if [[ $ip != *"."* ]]; then
        ip="not connected"
    fi
}

get_ip_wlan
if [ ! -z "$ip" ]; then
  echo "WLAN $ip"
  exit
else
  get_ip_eth
  if [ ! -z "$ip" ]; then
    echo "ETH $ip"
  fi
  exit
fi

echo "not connected"

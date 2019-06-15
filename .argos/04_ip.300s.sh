#!/usr/bin/env bash

function get_ip_wlan() {
  no_of_broadcasts="$(ifconfig | grep broadcast | wc -l)"
  if [ $no_of_broadcasts = "2" ]; then
    ip="$(ifconfig | grep broadcast | awk '{print $2}' | tail -n1)"
  fi
}

function get_ip_eth() {
  ip="$(ifconfig | grep ether | awk '{print $2}')"
  if [[ $ip != *"."* ]]; then
    ip=""
  fi
}

get_ip_wlan
if [ ! -z "$ip" ]; then
  echo "WLAN $ip"
else
  get_ip_eth
  if [ ! -z "$ip" ]; then
    echo "ETH $ip"
  else
    echo "not connected"
  fi
fi


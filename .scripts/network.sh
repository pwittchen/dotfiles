#!/usr/bin/env bash

function status {
  nmcli dev status
}

function connections {
 nmcli connection show
}

function active {
  nmcli connection show --active
}

function wifi {
  nmcli radio wifi
}

function wifion {
  nmcli radio wifi on
}

function wifioff {
  nmcli radio wifi off
}

function wifilist {
  nmcli dev wifi
}

function wificonnect {
  nmcli --ask device wifi connect $1
}

function wifirescan {
  nmcli dev wifi rescan
}

function down {
  nmcli connection down $1
}

function up {
  nmcli connection up $1
}

function help {
    echo "
    network.sh is a simple wrapper for nmcli for network management

    usage:

    help            shows help
    status          shows status
    connections     shows connections
    active          shows active connections
    wifi            shows wifi status
    wifion          enables wifi
    wifioff         disables wifi
    wifilist        shows wifi access points
    wificonnect     connects to the given wifi access point
    wifirescan      rescans wifi access points
    down            disconnects from the given connection
    up              connects back to the given connection
    "
}

function main {
  if [ -z "$1" ] || [ "$1" == "help" ] ; then
    help
    exit
  fi
  if [ "$1" == "status" ]; then
    status
    exit
  fi
  if [ "$1" == "connections" ]; then
    connections
    exit
  fi
  if [ "$1" == "active" ]; then
    active
    exit
  fi
  if [ "$1" == "wifi" ]; then
    wifi
    exit
  fi
  if [ "$1" == "wifion" ]; then
    wifion
    exit
  fi
  if [ "$1" == "wifioff" ]; then
    wifioff
    exit
  fi
  if [ "$1" == "wifilist" ]; then
    wifilist
    exit
  fi
  if [ "$1" == "wificonnect" ]; then
    wificonnect $2
    exit
  fi
  if [ "$1" == "wifirescan" ]; then
    wifirescan
    exit
  fi
  if [ "$1" == "down" ]; then
    down $2
    exit
  fi
  if [ "$1" == "up" ]; then
    up $2
    exit
  fi
}

main "$@"

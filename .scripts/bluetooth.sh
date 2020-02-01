#!/usr/bin/env bash

function devices {
  bluetoothctl devices 
}

function paired_devices {
  bluetoothctl paired-devices 
}

function connect_mouse {
  connect_device "MX Master"
}

function connect_headphones {
  connect_device "MOMENTUM TW"
}

function connect_speaker {
  connect_device "JBL Charge 3"
}

function connect_device {
  mac_address=$(bluetoothctl devices | grep "$1" | awk '{print $2}')
  bluetoothctl connect $mac_address
}

function scan {
  bluetoothctl scan on
}

function on {
  bluetoothctl power on
}

function off {
  bluetoothctl power off
}

function help {
    echo "
    bluetooth.sh is a simple wrapper for bluetoothctl for bluetooth management

    usage:

    help               shows help
    devices	       shows devices
    paired_devices     shows paired devices
    connect_mouse      connects mouse
    connect_headphones connects headphones
    connect_speaker    connects speaker
    scan	       starts scanning
    on 		       turns bt on
    off		       turns bt off
    "
}

function main {
  if [ -z "$1" ] || [ "$1" == "help" ] ; then
    help
    exit
  fi
  if [ "$1" == "status" ]; then
    info 
    exit
  fi
  if [ "$1" == "devices" ]; then
    devices
    exit
  fi
  if [ "$1" == "paired_devices" ]; then
    paired_devices
    exit
  fi
  if [ "$1" == "connect_mouse" ]; then
    connect_mouse
    exit
  fi
  if [ "$1" == "connect_headphones" ]; then
    connect_headphones
    exit
  fi
  if [ "$1" == "connect_speaker" ]; then
    connect_speaker
    exit
  fi
  if [ "$1" == "scan" ]; then
    scan
  fi
  if [ "$1" == "on" ]; then
    on 
  fi
  if [ "$1" == "off" ]; then
    off 
  fi
}

main "$@"

#!/usr/bin/env bash

# showing information

function devices {
  bluetoothctl devices
}

function paired_devices {
  bluetoothctl paired-devices
}

# connecting to devices

function connect_mouse_mx {
  connect_device "MX Master"
}

function connect_mouse_mx_3 {
  connect_device "MX Master 3"
}

function connect_mouse_ultrathin {
  connect_device "Ultrathin Touch Mouse"
}

function connect_keyboard_k380_1 {
  mac_address=$(bluetoothctl devices | grep "K380" | awk '{print $2}' | head -n 1)
  bluetoothctl connect $mac_address
}

function connect_keyboard_k380_2 {
  mac_address=$(bluetoothctl devices | grep "K380" | awk '{print $2}' | tail -n 1)
  bluetoothctl connect $mac_address
}

function connect_keyboard_k3 {
  connect_device "Keychron K3"
}

function connect_keyboard_mx_keys_mini {
  connect_device "MX Keys Mini"
}

function connect_headphones {
  connect_device "MOMENTUM TW"
}

function connect_speaker {
  connect_device "JBL Charge 3"
}

# disconnecting from devices

function disconnect_mouse_mx {
  disconnect_device "MX Master"
}

function disconnect_mouse_mx_3 {
  disconnect_device "MX Master 3"
}

function disconnect_mouse_ultrathin {
  disconnect_device "Ultrathin Touch Mouse"
}

function disconnect_keyboard_k380_1 {
  mac_address=$(bluetoothctl devices | grep "K380" | awk '{print $2}' | head -n 1)
  bluetoothctl disconnect $mac_address
}

function disconnect_keyboard_k380_2 {
  mac_address=$(bluetoothctl devices | grep "K380" | awk '{print $2}' | tail -n 1)
  bluetoothctl disconnect $mac_address
}

function disconnect_keyboard_k3 {
  disconnect_device "Keychron K3"
}

function disconnect_headphones {
  disconnect_device "MOMENTUM TW"
}

function disconnect_speaker {
  disconnect_device "JBL Charge 3"
}

function connect_device {
  mac_address=$(bluetoothctl devices | grep "$1" | awk '{print $2}')
  bluetoothctl connect $mac_address
}

function disconnect_device {
  mac_address=$(bluetoothctl devices | grep "$1" | awk '{print $2}')
  bluetoothctl disconnect $mac_address
}

# general controls

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

    help                           shows help
    devices                        shows devices
    paired_devices                 shows paired devices

    connect_mouse_mx               connects mx mouse
    connect_mouse_mx_3             connects mx 3 mouse
    connect_mouse_ultrathin        connects ultrathin mouse
    connect_keyboard_k380_1        connects keyboard logitech k380 (first)
    connect_keyboard_k380_2        connects keyboard logitech k380 (second)
    connect_keyboard_k3            connects keyboard keychron k3
    connect_keyboard_mx_keys_mini  connects keyboard logitech mx keys mini
    connect_headphones             connects headphones
    connect_speaker                connects speaker

    disconnect_mouse_mx            connects mx mouse
    disconnect_mouse_ultrathin     connects ultrathin mouse
    disconnect_keyboard_k380_1     connects keyboard logitech k380 (first)
    disconnect_keyboard_k380_2     connects keyboard logitech k380 (second)
    disconnect_keyboard_k3         connects keyboard keychron k3
    disconnect_headphones          connects headphones
    disconnect_speaker             connects speaker

    scan                           starts scanning
    on                             turns bt on
    off                            turns bt off
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
  if [ "$1" == "connect_mouse_mx" ]; then
    connect_mouse_mx
    exit
  fi
  if [ "$1" == "connect_mouse_mx_3" ]; then
    connect_mouse_mx_3
    exit
  fi
  if [ "$1" == "connect_mouse_ultrathin" ]; then
    connect_mouse_ultrathin
    exit
  fi
  if [ "$1" == "connect_keyboard_k380_1" ]; then
    connect_keyboard_k380_1
    exit
  fi
  if [ "$1" == "connect_keyboard_k380_2" ]; then
    connect_keyboard_k380_2
    exit
  fi
  if [ "$1" == "connect_keyboard_k3" ]; then
    connect_keyboard_k3
    exit
  fi
  if [ "$1" == "connect_keyboard_mx_keys_mini" ]; then
    connect_keyboard_mx_keys_mini
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
  if [ "$1" == "disconnect_mouse_mx" ]; then
    disconnect_mouse_mx
    exit
  fi
  if [ "$1" == "disconnect_mouse_mx_3" ]; then
    disconnect_mouse_mx_3
    exit
  fi
  if [ "$1" == "disconnect_mouse_ultrathin" ]; then
    disconnect_mouse_ultrathin
    exit
  fi
  if [ "$1" == "disconnect_keyboard_k380_1" ]; then
    disconnect_keyboard_k380_1
    exit
  fi
  if [ "$1" == "disconnect_keyboard_k380_2" ]; then
    disconnect_keyboard_k380_2
    exit
  fi
  if [ "$1" == "disconnect_keyboard_k3" ]; then
    disconnect_keyboard_k3
    exit
  fi
  if [ "$1" == "disconnect_headphones" ]; then
    disconnect_headphones
    exit
  fi
  if [ "$1" == "disconnect_speaker" ]; then
    disconnect_speaker
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

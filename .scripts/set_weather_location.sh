#!/usr/bin/env bash

function gliwice {
  echo "LOCATION=Gliwice" > ~/.config/scripts/weather.conf
}

function london {
  echo "LOCATION=London" > ~/.config/scripts/weather.conf
}

function help {
    echo "
    set_weather_location.sh is a simple script for setting location for weather script

    defined locations:

    gliwice
    london
   "
}

function main {
  if [ -z "$1" ] || [ "$1" == "help" ] ; then
    help
    exit
  fi
  if [ "$1" == "gliwice" ]; then
    gliwice
    exit
  fi
  if [ "$1" == "london" ]; then
    london
    exit
  fi
}

main "$@"

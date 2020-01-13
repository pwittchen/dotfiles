#!/usr/bin/env bash

function warsaw {
  sudo ln -sf /usr/share/zoneinfo/Europe/Warsaw /etc/localtime
}

function london {
  sudo ln -sf /usr/share/zoneinfo/Europe/London /etc/localtime
}

function help {
    echo "
    set_timezone.sh is a simple script for setting time zones

    defined time zones:

    warsaw
    london
   "
}

function main {
  if [ -z "$1" ] || [ "$1" == "help" ] ; then
    help
    exit
  fi
  if [ "$1" == "warsaw" ]; then
    warsaw
    exit
  fi
  if [ "$1" == "london" ]; then
    london
    exit
  fi
}

main "$@"

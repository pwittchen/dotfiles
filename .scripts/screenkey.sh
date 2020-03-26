#!/usr/bin/env bash

function start {
  screenkey &
}

function stop {
  ps -ax | grep screenkey | grep -v grep | awk '{print $1}' | xargs kill -9
}

function help {
    echo "
    screenkey.sh is a wrapper for screenkey program for starting and stopping it 

    usage:

    start 
    stop 
   "
}

function main {
  if [ -z "$1" ] || [ "$1" == "help" ] ; then
    help
    exit
  fi
  if [ "$1" == "start" ]; then
    start 
    exit
  fi
  if [ "$1" == "stop" ]; then
    stop 
    exit
  fi
}

main "$@"

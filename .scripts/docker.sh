#!/usr/bin/env bash

function run {
  sudo docker build -t $1 .
}

function stop {
  sudo docker stop $(sudo docker ps | grep $1 | awk 'NF>1{print $NF}')
}

function stop_recent {
  sudo docker ps | tail -n1 | awk '{print $1}' | xargs sudo docker stop
}

function remove {
  sudo docker rmi -f $(sudo docker images | grep $1 | awk '{print $3}')
}

function help {
    echo "
    docker.sh is a helper script for docker 

    usage:
    run <image>
    stop <image>
    stop_recent 
    remove <image>
   "
}

function main {
  if [ -z "$1" ] || [ "$1" == "help" ] ; then
    help
    exit
  fi
  if [ "$1" == "run" ]; then
    run $2 
    exit
  fi
  if [ "$1" == "stop" ]; then
    stop $2 
    exit
  fi
  if [ "$1" == "stop_recent" ]; then
    stop_recent 
    exit
  fi
  if [ "$1" == "remove" ]; then
    remove $2
    exit
  fi
}

main "$@"

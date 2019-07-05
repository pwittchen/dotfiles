#!/usr/bin/env bash
if [ $# -eq 0 ]; then
  echo "no arguments supplied"
else
  sudo docker rmi -f $(sudo docker images | grep $1 | awk '{print $3}')
fi

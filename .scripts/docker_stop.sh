#!/usr/bin/env bash
if [ $# -eq 0 ]; then
  echo "no arguments supplied"
else
  sudo docker stop $(sudo docker ps | grep $1 | awk 'NF>1{print $NF}')
fi

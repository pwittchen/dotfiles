#!/usr/bin/env bash
if [ $# -eq 0  ]; then
  echo "no arguments supplied"
else
  sudo docker build -t $1 .
fi

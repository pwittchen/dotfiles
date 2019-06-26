#!/usr/bin/env bash

function build_docker_image_with_name() {
  if [ $# -eq 0  ]; then
    echo "no arguments supplied"
  else
    sudo docker build -t $1 .
  fi
}

function stop_running_docker_container_by_name() {
  if [ $# -eq 0 ]; then
    echo "no arguments supplied"
  else
    sudo docker stop $(sudo docker ps | grep $1 | awk 'NF>1{print $NF}')
  fi
}

function remove_docker_image_by_name() {
  if [ $# -eq 0 ]; then
    echo "no arguments supplied"
  else
    sudo docker rmi -f $(sudo docker images | grep $1 | awk '{print $3}')
  fi
}

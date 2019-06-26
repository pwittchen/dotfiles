#!/usr/bin/env bash

function build_docker_image_with_name() {
  if [ $# -eq 0  ]; then
    echo "no arguments supplied"
  else
    sudo docker build -t $1 .
  fi
}

function run_docker_container(){
  host=$1
  port_in=$2
  port_out=$3
  image_name=$4
  mode=$5
  if [ $# -eq 0 ]; then
    echo "no arguments supplied"
    echo "usage: runDockerContainer HOST PORT_IN PORT_OUT IMAGE_NAME MODE (fg=""|bg="d")"
  else
    sudo docker run -p $host:$port_in:$port_out -t$mode $image_name
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

function list_docker_images() {
  sudo docker images
}

function list_running_docker_containers() {
    sudo docker ps
}

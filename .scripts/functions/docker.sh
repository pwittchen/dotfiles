#!/usr/bin/env bash

function buildDockerContainerWithName() {
  sudo docker build -t $1 .
}

function runDockerContainer() {
  host=$1
  port_in=$2
  port_out=$3
  image_name=$4
  if [ $# -eq 0  ]; then
    echo "no arguments supplied"
    echo "usage: runDockerContainer HOST PORT_IN PORT_OUT IMAGE_NAME"
  else
    sudo docker run -p $host:$port_in:$port_out -t $image_name
  fi
}

function runDockerContainerInBg() {
  host=$1
  port_in=$2
  port_out=$3
  image_name=$4
  if [ $# -eq 0  ]; then
    echo "no arguments supplied"
    echo "usage: runDockerContainerInBg HOST PORT_IN PORT_OUT IMAGE_NAME"
  else
    sudo docker run -p $host:$port_in:$port_out -td $image_name
  fi
}

function stopRunningDockerContainerByName() {
  sudo docker stop $(sudo docker ps | grep $1 | awk 'NF>1{print $NF}')
}

function removeDockerContainerByName() {
  sudo docker rmi -f $(sudo docker images | grep $1 | awk '{print $3}')
}

function listDockerImages() {
  sudo docker images
}

function listRunningDockerContainers() {
    sudo docker ps
}

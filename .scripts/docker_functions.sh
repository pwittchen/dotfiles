#!/usr/bin/env bash

function removeDockerContainerByName() {
  sudo docker rmi -f $(sudo docker images | grep $1 | awk '{print $3}')
}

#!/usr/bin/env bash
# stops recently started docker container
sudo docker ps | tail -n1 | awk '{print $1}' | xargs sudo docker stop

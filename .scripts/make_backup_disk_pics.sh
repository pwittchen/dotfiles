#!/usr/bin/env bash
disk_name=$(ls /media/`whoami` | tail -1)
if [ "$disk_name" != "" ]; then
  destination=/media/$(whoami)/$disk_name/pics/
  if [ ! -d $destination ]; then
    mkdir -p $destination
  else
    sudo rm -rf $destination/*
  fi
  sudo cp -avru ~/Obrazy/* $destination
  date >> /var/log/scripts/disk_backup_pics.log
else
  echo "disk is not connected"
fi

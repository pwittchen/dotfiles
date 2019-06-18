#!/usr/bin/env bash
disk_name=$(ls /media/`whoami` | tail -1)
if [ "$disk_name" != "" ]; then
  destination=/media/$(whoami)/$disk_name/photos/
  if [ ! -d $destination ]; then
    mkdir -p $destination
  fi
  sudo cp -avru ~/Obrazy/photos/* $destination
  date >> ~/Dokumenty/logs/disk_backup_pics.log
else
  echo "disk is not connected"
fi

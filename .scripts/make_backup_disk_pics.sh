#!/usr/bin/env bash
disk_name=$(ls /media/`whoami` | tail -1)
if [ $disk_name != "" ]; then
  sudo cp -avru ~/Obrazy/photos/* /media/$(whoami)/$disk_name/photos/
  date >> ~/Dokumenty/logs/disk_backup_pics.log
else
  echo "disk is not connected"
fi

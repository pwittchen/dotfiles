#!/usr/bin/env bash
disk_name=$(ls /run/media/`whoami` | tail -1)
if [ "$disk_name" != "" ]; then
  rm -rf ~/Backup/*
  cp -avr ~/Documents/ebooks ~/Backup/ebooks
  cp -avr ~/Documents/finance ~/Backup/finance
  cp -avr ~/Documents/sport ~/Backup/sport
  cp -avr ~/Documents/guitar ~/Backup/guitar
  cp -avr ~/Documents/licenses ~/Backup/licenses
  cp -avr ~/Documents/other ~/Backup/other
  cp -avr ~/Documents/presentations ~/Backup/presentations
  cp -avr ~/Documents/tmp ~/Backup/tmp
  cp -avr ~/Documents/travel ~/Backup/travel
  cp -avr ~/Documents/work ~/Backup/work
  mkdir -p ~/Backup/secrets
  cp -avr ~/.gnupg ~/Backup/secrets/.gnupg
  cp -avr ~/.password-store ~/Backup/secrets/.password-store
  cp -avr ~/.config/scripts ~/Backup/secrets/.configscripts
  destination=/run/media/$(whoami)/$disk_name/docs/
  if [ ! -d "$destination" ]; then
    mkdir -p $destination
  else
    sudo rm -rf $destination/*
  fi
  sudo cp -avru ~/Backup/* $destination
  date >> /var/log/scripts/disk_backup_docs.log
else
  echo "disk is not connected"
fi

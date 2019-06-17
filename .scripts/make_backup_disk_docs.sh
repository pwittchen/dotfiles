#!/usr/bin/env bash
source ~/.config/scripts/external_disk.conf
rm -rf ~/Backup/*
cp -avr ~/Dokumenty/ebooks ~/Backup/ebooks
cp -avr ~/Dokumenty/finance ~/Backup/finance
cp -avr ~/Dokumenty/gym ~/Backup/gym
cp -avr ~/Dokumenty/guitar ~/Backup/guitar
cp -avr ~/Dokumenty/licenses ~/Backup/licenses
cp -avr ~/Dokumenty/other ~/Backup/other
cp -avr ~/Dokumenty/presentations ~/Backup/presentations
cp -avr ~/Dokumenty/tmp ~/Backup/tmp
cp -avr ~/Dokumenty/travel ~/Backup/travel
cp -avr ~/Dokumenty/work ~/Backup/work
cp -avr ~/Obrazy/wallpapers ~/Backup/wallpapers
mkdir -p ~/Backup/secrets
cp -avr ~/.gnupg ~/Backup/secrets/.gnupg
cp -avr ~/.password-store ~/Backup/secrets/.password-store
cp -avr ~/.config/scripts ~/Backup/secrets/.configscripts
sudo cp -avr ~/Backup/* /media/$(whoami)/$DISK_NAME/documents/
date >> ~/Dokumenty/logs/disk_backup_docs.log

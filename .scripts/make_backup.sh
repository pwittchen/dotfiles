#!/usr/bin/env bash

source ~/.config/scripts/make_backup.conf

echo "starting backup process"

rm -rf ~/Backup/*

echo "preparing directories to backup"

cp -avr ~/Dokumenty/ebooks ~/Backup/ebooks
cp -avr ~/Dokumenty/finance ~/Backup/finance
cp -avr ~/Dokumenty/gym ~/Backup/gym
cp -avr ~/Dokumenty/licenses ~/Backup/licenses
cp -avr ~/Dokumenty/other ~/Backup/other
cp -avr ~/Dokumenty/presentations ~/Backup/presentations
cp -avr ~/Dokumenty/secret ~/Backup/secret
cp -avr ~/Dokumenty/tmp ~/Backup/tmp
cp -avr ~/Dokumenty/travel ~/Backup/travel
cp -avr ~/Dokumenty/work ~/Backup/work

echo "uploading data to the FTP server"

lftp ftp://$USER:$PASS@$HOST -e "set ftp:ssl-allow no; mirror -R -v --delete-first ~/Backup backup; quit"

date >> ~/Dokumenty/logs/ftp_backup.log

echo "backup finished"

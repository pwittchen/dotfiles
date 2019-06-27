#!/usr/bin/env bash
source ~/.config/scripts/ftp_server.conf
rm -rf ~/Backup/*
cp -avr ~/Dokumenty/ebooks ~/Backup/ebooks
cp -avr ~/Dokumenty/finance ~/Backup/finance
cp -avr ~/Dokumenty/sport ~/Backup/sport
cp -avr ~/Dokumenty/guitar ~/Backup/guitar
cp -avr ~/Dokumenty/licenses ~/Backup/licenses
cp -avr ~/Dokumenty/other ~/Backup/other
cp -avr ~/Dokumenty/presentations ~/Backup/presentations
cp -avr ~/Dokumenty/tmp ~/Backup/tmp
cp -avr ~/Dokumenty/travel ~/Backup/travel
cp -avr ~/Dokumenty/work ~/Backup/work
cp -avr ~/Drivers ~/Backup/drivers
cp -avr ~/Obrazy/wallpapers ~/Backup/wallpapers
mkdir -p ~/Backup/secrets
cp -avr ~/.gnupg ~/Backup/secrets/.gnupg
cp -avr ~/.password-store ~/Backup/secrets/.password-store
cp -avr ~/.config/scripts ~/Backup/secrets/.configscripts
cp -avr ~/.ssh ~/Backup/secrects/.ssh
lftp ftp://$USER:$PASS@$HOST -e "set ftp:ssl-allow no; mirror -R -v --delete-first ~/Backup backup; quit"
date >> /var/log/scripts/ftp_backup_out.log

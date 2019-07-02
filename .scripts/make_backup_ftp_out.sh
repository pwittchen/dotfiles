#!/usr/bin/env bash
source ~/.config/scripts/ftp_server.conf
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
cp -avr ~/Pictures/wallpapers ~/Backup/wallpapers
mkdir -p ~/Backup/secrets
cp -avr ~/.gnupg ~/Backup/secrets/.gnupg
cp -avr ~/.password-store ~/Backup/secrets/.password-store
cp -avr ~/.config/scripts ~/Backup/secrets/.configscripts
/usr/bin/lftp ftp://$USER:$PASS@$HOST -e "set ftp:ssl-allow no; mirror -R -v --delete-first ~/Backup backup; quit"
date >> /var/log/scripts/ftp_backup_out.log

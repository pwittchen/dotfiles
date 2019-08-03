#!/usr/bin/env bash
source ~/.config/scripts/linuxpl.conf

rm -rf ~/Backup/*
cp -avr ~/Documents/ebooks ~/Backup/ebooks
cp -avr ~/Documents/finance ~/Backup/finance
cp -avr ~/Documents/sport ~/Backup/sport
cp -avr ~/Documents/guitar ~/Backup/guitar
cp -avr ~/Documents/licenses ~/Backup/licenses
cp -avr ~/Documents/notes ~/Backup/notes
cp -avr ~/Documents/datelog ~/Backup/datelog
cp -avr ~/Documents/other ~/Backup/other
cp -avr ~/Documents/presentations ~/Backup/presentations
cp -avr ~/Documents/travel ~/Backup/travel
cp -avr ~/Documents/work ~/Backup/work
cp -avr ~/Pictures/wallpapers ~/Backup/wallpapers
cp -avr ~/.newsboat ~/Backup/newsboat
mkdir -p ~/Backup/secrets
cp -avr ~/.gnupg ~/Backup/secrets/.gnupg
cp -avr ~/.password-store ~/Backup/secrets/.password-store
cp -avr ~/.config/scripts ~/Backup/secrets/.configscripts
chmod 777 ~/Backup/*
/usr/bin/lftp ftp://$SERVER_LINUX_PL_USER:$SERVER_LINUX_PL_PASS@$SERVER_LINUX_PL -e "set ftp:ssl-allow no; mirror -R -v --delete-first ~/Backup backup; quit"
date >> /var/log/scripts/ftp_backup_out.log

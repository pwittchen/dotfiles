#!/usr/bin/env bash
source ~/.config/scripts/linuxpl.conf

rm -rf ~/backup/*
cp -avr ~/Documents/ebooks ~/backup/ebooks
cp -avr ~/Documents/articles ~/backup/articles
cp -avr ~/Documents/finance ~/backup/finance
cp -avr ~/Documents/sport ~/backup/sport
cp -avr ~/Documents/guitar ~/backup/guitar
cp -avr ~/Documents/licenses ~/backup/licenses
cp -avr ~/Documents/notes ~/backup/notes
cp -avr ~/Documents/datelog ~/backup/datelog
cp -avr ~/Documents/other ~/backup/other
cp -avr ~/Documents/presentations ~/backup/presentations
cp -avr ~/Documents/travel ~/backup/travel
cp -avr ~/Documents/work ~/backup/work
cp -avr ~/Pictures/wallpapers ~/backup/wallpapers
cp -avr ~/.newsboat ~/backup/newsboat
mkdir -p ~/backup/secrets
cp -avr ~/.gnupg ~/backup/secrets/.gnupg
cp -avr ~/.password-store ~/backup/secrets/.password-store
cp -avr ~/.config/scripts ~/backup/secrets/.configscripts
cp -avr ~/.config/openvpn ~/backup/openvpn
chmod 777 ~/backup/*
/usr/bin/lftp ftp://$SERVER_LINUX_PL_USER:$SERVER_LINUX_PL_PASS@$SERVER_LINUX_PL -e "set ftp:ssl-allow no; mirror -R -v --delete-first ~/backup backup; quit"
date >> /var/log/scripts/ftp_backup_out.log

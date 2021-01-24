#!/usr/bin/env bash
source ~/.config/scripts/linuxpl.conf

rm -rf ~/backup/*
cp -avr ~/documents/ebooks ~/backup/ebooks
cp -avr ~/documents/articles ~/backup/articles
cp -avr ~/documents/finance ~/backup/finance
cp -avr ~/documents/sport ~/backup/sport
cp -avr ~/documents/guitar ~/backup/guitar
cp -avr ~/documents/licenses ~/backup/licenses
cp -avr ~/documents/notes ~/backup/notes
cp -avr ~/documents/datelog ~/backup/datelog
cp -avr ~/documents/other ~/backup/other
cp -avr ~/documents/presentations ~/backup/presentations
cp -avr ~/documents/travel ~/backup/travel
cp -avr ~/documents/work ~/backup/work
cp -avr ~/documents/notebook ~/backup/notebook
cp -avr ~/.newsboat ~/backup/newsboat
mkdir -p ~/backup/secrets
cp -avr ~/.gnupg ~/backup/secrets/.gnupg
cp -avr ~/.password-store ~/backup/secrets/.password-store
cp -avr ~/.kube/configs-backup ~/backup/secrets/kube-configs-backup
cp -avr ~/.config/scripts ~/backup/secrets/.configscripts
cp -avr ~/.ssh/ ~/backup/secrets/.ssh
cp -avr ~/.vpn/ ~/backup/secrets/.vpn
chmod 777 ~/backup/*
/usr/bin/lftp ftp://$SERVER_LINUX_PL_USER:$SERVER_LINUX_PL_PASS@$SERVER_LINUX_PL -e "set ftp:ssl-allow no; mirror -R -v --delete-first ~/backup backup; quit"
date >> /var/log/scripts/ftp_backup_out.log
export DISPLAY=:0.0 && notify-send "backup" "backup data saved on server"

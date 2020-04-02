#!/usr/bin/env bash
source ~/.config/scripts/linuxpl.conf
/usr/bin/lftp ftp://$SERVER_LINUX_PL_USER:$SERVER_LINUX_PL_PASS@$SERVER_LINUX_PL -e "set ftp:ssl-allow no; mirror -v input ~/documents/input; quit"
date >> /var/log/scripts/ftp_backup_in.log
export DISPLAY=:0.0 && notify-send "backup" "input data downloaded from server"

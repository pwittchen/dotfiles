#!/usr/bin/env bash
source ~/.config/scripts/cyberfolks.conf
/usr/bin/lftp ftp://$SERVER_CYBERFOLKS_USER:$SERVER_CYBERFOLKS_PASS@$SERVER_CYBERFOLKS -e "set ftp:ssl-allow no; mirror -v input ~/documents/input; quit"
date >> /var/log/scripts/ftp_backup_in.log
export DISPLAY=:0.0 && notify-send "backup" "input data downloaded from server"

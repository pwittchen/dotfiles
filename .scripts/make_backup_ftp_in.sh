#!/usr/bin/env bash
source ~/.config/scripts/ftp_server.conf
/usr/bin/lftp ftp://$USER:$PASS@$HOST -e "set ftp:ssl-allow no; mirror -v input ~/Documents/input; quit"
date >> /var/log/scripts/ftp_backup_in.log

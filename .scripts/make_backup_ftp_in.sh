#!/usr/bin/env bash
source ~/.config/scripts/linuxpl.conf

check_online=$(nm-online | grep "online")

if [ "$check_online" == "" ] ; then
  timestamp=$(date)
  msg="$timestamp no backup [offline]"
  echo "$msg" >> /var/log/scripts/ftp_backup_in.log
  exit
fi

/usr/bin/lftp ftp://$SERVER_LINUX_PL_USER:$SERVER_LINUX_PL_PASS@$SERVER_LINUX_PL -e "set ftp:ssl-allow no; mirror -v input ~/Documents/input; quit"
date >> /var/log/scripts/ftp_backup_in.log

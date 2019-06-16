#!/usr/bin/env bash

DISPLAY=:0.0
XAUTHORITY=/home/matrix/.Xauthority

source ~/.config/scripts/ftp_server.conf
/usr/bin/notify-send "input download started"
lftp ftp://$USER:$PASS@$HOST -e "set ftp:ssl-allow no; mirror -v input ~/Dokumenty/input; quit"
date >> ~/Dokumenty/logs/ftp_input.log
/usr/bin/notify-send "input downloaded"

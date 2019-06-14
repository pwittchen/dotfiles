#!/usr/bin/env bash

source ~/.config/scripts/ftp_server.conf
echo "downloading input from the server"
lftp ftp://$USER:$PASS@$HOST -e "set ftp:ssl-allow no; mirror -v input ~/Dokumenty/input; quit"
date >> ~/Dokumenty/logs/ftp_input.log
echo "download complete"

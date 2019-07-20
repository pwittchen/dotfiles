#!/usr/bin/env bash

source $HOME/.config/scripts/gmail.conf

check_online=$(nm-online | grep "online")

if [ "$check_online" == "" ] ; then
  echo " "
  exit
fi

msg_count=$(curl -u "$GMAIL_USER:$GMAIL_PASS" -s 'https://mail.google.com/mail/feed/atom' | xmllint --format - | grep fullcount | sed -e 's/<[^>]*>//g' | sed 's/ //g')

# tmp file is created to prevent sending the same notification multiple times
tmp_file="/tmp/email_notification_sent"

if [ "$msg_count" == "0" ] ; then
  echo "📪 $msg_count"
  rm -f "$tmp_file" || true
else 
  echo "📫 $msg_count"
  if [ ! -f "$tmp_file" ] ; then
    notify-send "e-mail" "you have $msg_count new message(s)"
    touch "$tmp_file"
  fi
fi

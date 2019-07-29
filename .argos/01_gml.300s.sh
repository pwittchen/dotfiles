#!/usr/bin/env bash

source $HOME/.config/scripts/gmail.conf

mail_feed=$(curl -u "$GMAIL_USER:$GMAIL_PASS" -s 'https://mail.google.com/mail/feed/atom')

if [ "$mail_feed" == "" ] ; then
 echo " "
 exit
fi

msg_count=$(echo $mail_feed | xmllint --format - | grep fullcount | sed -e 's/<[^>]*>//g' | sed 's/ //g')

# tmp file is created to prevent sending the same notification multiple times
tmp_file="/tmp/email_notification_sent"

if [ "$msg_count" == "0" ] ; then
  echo "email: $msg_count"
  rm -f "$tmp_file" || true
else 
  echo "email: $msg_count"
  if [ ! -f "$tmp_file" ] ; then
    notify-send "e-mail" "you have $msg_count new message(s)"
    touch "$tmp_file"
  fi
fi

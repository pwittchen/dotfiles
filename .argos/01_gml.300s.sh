#!/usr/bin/env bash
source $HOME/.config/scripts/gmail.conf

mail_feed=$(curl -u "$GMAIL_USER:$GMAIL_PASS" -s 'https://mail.google.com/mail/feed/atom')
tmp_file="/tmp/email_notification_sent"

if [ "$mail_feed" == "" ] ; then
  msg_count=0
else
  msg_count=$(echo $mail_feed | xmllint --format - | grep fullcount | sed -e 's/<[^>]*>//g' | sed 's/ //g')
fi

if [ "$msg_count" == "0" ] ; then
  rm -f "$tmp_file" || true
else
  if [ ! -f "$tmp_file" ] ; then
    notify-send "e-mail" "you have $msg_count new message(s)"
    touch "$tmp_file"
  fi
fi

echo "📪 $msg_count"

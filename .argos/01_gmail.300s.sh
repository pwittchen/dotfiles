#!/usr/bin/env bash

source $HOME/.config/scripts/gmail.conf

check_online=$(nm-online | grep "online")

if [ "$check_online" == "" ] ; then
  echo "⚠️  email off"
  exit
fi

msg_count=$(curl -u "$GMAIL_USER:$GMAIL_PASS" -s 'https://mail.google.com/mail/feed/atom' | xmllint --format - | grep fullcount | sed -e 's/<[^>]*>//g' | sed 's/ //g')

if [ "$msg_count" == "0" ] ; then
  echo "📪 $msg_count"
else 
  echo "📫 $msg_count"
fi

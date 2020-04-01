#!/usr/bin/env bash
source $HOME/.config/scripts/email.conf
mail_feed=$(curl -u "$USER:$PASS" -s 'https://mail.google.com/mail/u/0/feed/atom')
msg_count=$(echo $mail_feed | xmllint --format - | grep fullcount | sed -e 's/<[^>]*>//g' | sed 's/ //g')
[ "$msg_count" != "0" ] && notify-send "email" "you have $msg_count new message(s)"
echo "$msg_count" > /var/log/scripts/email.log

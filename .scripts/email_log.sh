#!/usr/bin/env bash
wifi_ap_name=$(nmcli connection show --active | grep wifi | awk '{print $1}')
wired_ap_device=$(nmcli connection show --active | grep ethernet | awk '{print $4}')
# this script should be executed in my home only to avoid google bans
[ "$wifi_ap_name" != "vcu" ] && [ "$wired_ap_device" != "enp0s31f6" ] && notify-send "email" "not connected to home wifi or cable network\nskipping email check" && exit
source $HOME/.config/scripts/email.conf
mail_feed=$(curl -u "$USER:$PASS" -s 'https://mail.google.com/mail/u/0/feed/atom')
msg_count=$(echo $mail_feed | xmllint --format - | grep fullcount | sed -e 's/<[^>]*>//g' | sed 's/ //g')
[ "$msg_count" != "0" ] && export DISPLAY=:0.0 && notify-send "email" "you have $msg_count unread message(s)"
echo "$msg_count" > /var/log/scripts/email.log

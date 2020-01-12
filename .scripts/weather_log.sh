#!/usr/bin/env bash

source ~/.config/scripts/weather.conf

/usr/bin/curl --compressed -s "wttr.in/$LOCATION?format=+%c+%t+%h+%p+%P+%w" > /var/log/scripts/weather.log
if grep -q Unknown /var/log/scripts/weather.log; then
  echo "" > /var/log/scripts/weather.log
fi
if grep -q Sorry /var/log/scripts/weather.log; then
  echo "" > /var/log/scripts/weather.log
fi
if grep -q Error /var/log/scripts/weather.log; then
  echo "" > /var/log/scripts/weather.log
fi

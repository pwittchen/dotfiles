#!/usr/bin/env bash
/usr/bin/curl --compressed -s "wttr.in/Gliwice?format=+%c+%t+%h+%p+%P+%w" > /var/log/scripts/weather.log
if grep -q Unknown /var/log/scripts/weather.log; then
  echo "" > /var/log/scripts/weather.log
fi

#!/usr/bin/env bash

source ~/.config/scripts/weather.conf

curl --compressed -s "wttr.in/$LOCATION?format=+%c+%t+%h+%p+%P+%w" | head -n1 > /var/log/scripts/weather.log
grep -q Unknown /var/log/scripts/weather.log && echo "" > /var/log/scripts/weather.log
grep -q Sorry /var/log/scripts/weather.log && echo "" > /var/log/scripts/weather.log
grep -q Error /var/log/scripts/weather.log && echo "" > /var/log/scripts/weather.log
grep -q Time-out /var/log/scripts/weather.log && echo "" > /var/log/scripts/weather.log

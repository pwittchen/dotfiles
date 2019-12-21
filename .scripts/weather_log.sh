#!/usr/bin/env bash
/usr/bin/curl --compressed -s "wttr.in/Gliwice?format=+%c+%t+%h+%p+%P+%w" > /var/log/scripts/weather.log

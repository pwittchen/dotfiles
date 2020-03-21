#!/usr/bin/env bash
stats=$(/usr/bin/python /home/pw/Development/prv/python/covid-19-pl/app.py summary | /usr/bin/tail -n1)
infected=$(echo $stats | awk --field-separator ";" '{print $1}')
dead=$(echo $stats | awk --field-separator ";" '{print $2}')
echo "☣ $infected ☠ $dead" > /var/log/scripts/covid_19_pl.log

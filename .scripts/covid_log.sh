#!/usr/bin/env bash
stats=$(/usr/bin/python /home/pw/Development/prv/python/covid-19-pl/app.py summary | /usr/bin/tail -n1)
echo "☣️ $stats" > /var/log/scripts/covid_19_pl.log

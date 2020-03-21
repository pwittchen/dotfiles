#!/usr/bin/env bash
python ~/Development/prv/python/covid-19-pl/app.py summary | tail -n1 | awk -F ";" '{print "☣ " $1 " ☠ " $2 }' > /var/log/scripts/covid_19_pl.log

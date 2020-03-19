#!/usr/bin/env bash
stat=$(/usr/bin/python /home/pw/Development/prv/python/covid-19-pl/app.py summary | /usr/bin/tail -n1)
when=$(date +%Y-%m-%d %H:%M:%S)
echo "$when,$stat" | sed "s/;/,/g"  >> /var/log/scripts/covid_19_pl_archive.log

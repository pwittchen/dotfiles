#!/usr/bin/env bash
stat=$(python ~/development/prv/python/covid-19-pl/app.py summary | tail -n1)
when=$(date "+%Y-%m-%d %H:%M:%S")
echo "$when,$stat" | sed "s/;/,/g"  >> /var/log/scripts/covid_19_pl_archive.log

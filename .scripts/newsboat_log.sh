#!/usr/bin/env bash
unread_articles=$(newsboat -x print-unread | awk '{print $1}') 
[ ! -z "$unread_articles" ] && echo $unread_articles > /var/log/scripts/newsboat.log

#!/usr/bin/env bash
unread_articles=$(newsboat -x print-unread | awk '{print $1}') 
if [ ! -z "$unread_articles" ]; then
  echo $unread_articles > /var/log/scripts/newsboat.log
fi

#!/usr/bin/env bash
newsboat_is_running=$(ps -ax | grep newsboat | grep -v grep)
if [ "$newsboat_is_running" == "" ] ; then
  newsboat -x print-unread | awk '{print $1}' > /var/log/scripts/newsboat.log
fi

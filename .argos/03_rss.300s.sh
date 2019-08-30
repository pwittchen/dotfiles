#!/usr/bin/env bash
newsboat_is_running=$(ps -ax | grep newsboat | grep -v grep)
tmp_file="/tmp/newsboat_no_of_unread_arts"

if [ "$newsboat_is_running" == "" ] ; then
  no_of_unread_arts=$(newsboat -x print-unread | awk '{print $1}')
  echo "$no_of_unread_arts" > $tmp_file
else
  if [ ! -f $tmp_file ] ; then
    no_of_unread_arts=0
  else
    no_of_unread_arts=$(cat $tmp_file)
  fi
fi

if [ "$no_of_unread_arts" == "" ] ; then
  echo " "
else
  echo "📶 $no_of_unread_arts"
fi

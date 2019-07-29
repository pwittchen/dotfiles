#!/usr/bin/env bash
no_of_unread_arts=$(newsboat -x print-unread | awk '{print $1}')
if [ "$no_of_unread_arts" == "" ] ; then
  echo "RSS: 0"
else
  echo "RSS: $no_of_unread_arts"
fi

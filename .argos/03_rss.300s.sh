#!/usr/bin/env bash
no_of_unread_arts=$(newsboat -x print-unread | awk '{print $1}')
if [ "$no_of_unread_arts" == "" ] ; then
  echo " "
else
  echo "📶 $no_of_unread_arts"
fi

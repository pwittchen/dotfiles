#!/usr/bin/env bash

if [ "$(lsusb | grep Pixel | wc -l)" == "1" ]; then
  echo "PXL" > /var/log/scripts/phone.log
else
  echo "" > /var/log/scripts/phone.log
fi

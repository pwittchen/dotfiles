#!/usr/bin/env bash
newsboat -x print-unread | awk '{print $1}' > /var/log/scripts/newsboat.log

#!/usr/bin/env bash
no_of_unread_arts=$(newsboat -x print-unread | awk '{print $1}')
echo "🗞️ $no_of_unread_arts"

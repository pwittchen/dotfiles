#!/usr/bin/env bash
status=$(/usr/bin/spotifycli --statusshort)
echo "♪ $status" > /var/log/scripts/spotify.log

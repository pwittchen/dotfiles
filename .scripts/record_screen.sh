#!/usr/bin/env bash
ffmpeg -f x11grab \
-s $(xdpyinfo | grep dimension | awk '{print $2}') \
-i $DISPLAY ~/Videos/out.mkv

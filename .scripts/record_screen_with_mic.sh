#!/usr/bin/env bash
ffmpeg -f x11grab \
-s $(xdpyinfo | grep dimension | awk '{print $2}') \
-i :0.0 -f alsa -i default ~/Videos/out.mkv

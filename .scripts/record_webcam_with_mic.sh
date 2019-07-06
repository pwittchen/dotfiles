#!/usr/env/bin bash
ffmpeg -i /dev/video0 -f alsa -i default ~/Videos/out.mkv

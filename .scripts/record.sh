#!/usr/bin/env bash

function record_screen {
  ffmpeg -f x11grab \
  -s $(xdpyinfo | grep dimension | awk '{print $2}') \
  -i $DISPLAY ~/videos/out.mkv
}

function record_screen_with_mic {
  ffmpeg -f x11grab \
  -s $(xdpyinfo | grep dimension | awk '{print $2}') \
  -i $DISPLAY -f alsa -i default ~/videos/out.mkv
}

function record_webcam {
  ffmpeg -i /dev/video0 ~/videos/out.mkv
}

function record_webcam_with_mic {
  ffmpeg -i /dev/video0 -f alsa -i default ~/videos/out.mkv
}

function help {
    echo "
    record.sh is a simple script for recording screen casts and videos from webcam

    usage:

    record_screen             records video from screen
    record_screen_with_mic    records video from screen with sound from microphone
    record_webcam             records video from webcam
    record_webcam_with_mic    records video from webcam with sound from microphone
   "
}

function main {
  if [ -z "$1" ] || [ "$1" == "help" ] ; then
    help
    exit
  fi
  if [ "$1" == "record_screen" ]; then
    record_screen
    exit
  fi
  if [ "$1" == "record_screen_with_mic" ]; then
    record_screen_with_mic
    exit
  fi
  if [ "$1" == "record_webcam" ]; then
    record_webcam
    exit
  fi
  if [ "$1" == "record_webcam_with_mic" ]; then
    record_webcam_with_mic
    exit
  fi
}

main "$@"

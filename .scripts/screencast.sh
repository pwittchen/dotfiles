#!/usr/bin/env bash

function record_screen {
  notify-send "started recording screen"
  ffmpeg -f x11grab \
  -s $(xdpyinfo | grep dimension | awk '{print $2}') \
  -i $DISPLAY ~/videos/out.mkv
}

function record_screen_with_mic {
  notify-send "started recording screen with mic"
  ffmpeg -f x11grab \
  -s $(xdpyinfo | grep dimension | awk '{print $2}') \
  -i $DISPLAY -f alsa -i default ~/videos/out.mkv
}

function record_webcam {
  notify-send "started recording webcam"
  ffmpeg -i /dev/video0 ~/videos/out.mkv
}

function record_webcam_with_mic {
  notify-send "started recording webcam with mic"
  ffmpeg -i /dev/video0 -f alsa -i default ~/videos/out.mkv
}

function stream_webcam_internal {
  notify-send "started streaming internal webcam"
  mpv av://v4l2:/dev/video0
  notify-send "stopped streaming internal webcam"
}

function stream_webcam_external {
  notify-send "started streaming external webcam"
  mpv av://v4l2:/dev/video2
  notify-send "stopped streaming external webcam"
}

function keys_on {
  screenkey &
  notify-send "screenkey on"
}

function keys_off {
  ps -ax | grep screenkey | grep -v grep | awk '{print $1}' | xargs kill -9
  notify-send "screenkey off"
}

function help {
    echo "
    screencast.sh is a simple script for recording screencasts,
    streaming videos from the webcam and displaying key strokes

    usage:

    record_screen             records video from screen
    record_screen_with_mic    records video from screen with sound from microphone
    record_webcam             records video from webcam
    record_webcam_with_mic    records video from webcam with sound from microphone
    stream_webcam_internal    streams built-in laptop webcam with mpv
    stream_webcam_external    streams external connected webcam with mpv
    keys_on                   displays key strokes with screenkey
    keys_off                  stops displaying key strokes with screenkey
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
  if [ "$1" == "stream_webcam_internal" ]; then
    stream_webcam_internal
    exit
  fi
  if [ "$1" == "stream_webcam_external" ]; then
    stream_webcam_external
    exit
  fi
  if [ "$1" == "keys_on" ]; then
    keys_on
    exit
  fi
  if [ "$1" == "keys_off" ]; then
    keys_off
    exit
  fi
}

main "$@"

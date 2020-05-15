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
  -i $DISPLAY -f pulse -ac 2 -i default ~/videos/out.mkv
}

function record_webcam_0 {
  notify-send "started recording webcam 0"
  ffmpeg -i /dev/video0 ~/videos/out.mkv
}

function record_webcam_0_mic {
  notify-send "started recording webcam 0 with mic"
  ffmpeg -i /dev/video0 -f pulse -ac 2 -i default ~/videos/out.mkv
}

function record_webcam_2 {
  notify-send "started recording webcam 2"
  ffmpeg -i /dev/video2 ~/videos/out.mkv
}

function record_webcam_2_mic {
  notify-send "started recording webcam 2 with mic"
  ffmpeg -i /dev/video2 -f pulse -ac 2 -i default ~/videos/out.mkv
}

function stream_webcam_0 {
  notify-send "started streaming webcam 0"
  mpv av://v4l2:/dev/video0 &
}

function stream_webcam_2 {
  notify-send "started streaming webcam 2"
  mpv av://v4l2:/dev/video2 &
}

function kill_webcam {
  sudo pkill -9 mpv
  notify-send "stopped webcam stream"
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
    record_webcam_0           records video from webcam 0
    record_webcam_0_mic       records video from webcam 0 with sound from microphone
    record_webcam_2           records video from webcam 2
    record_webcam_2_mic       records video from webcam 2 with sound from microphone
    stream_webcam_0           streams webcam 0
    stream_webcam_2           streams webcam 2
    kill_webcam		      kills currently opened webcam stream
    keys_on                   displays key strokes with screenkey
    keys_off                  stops displaying key strokes with screenkey
   "
}

function main {
  [ -z "$1" ] || [ "$1" == "help" ] && help && exit
  [ "$1" == "record_screen" ] && record_screen && exit
  [ "$1" == "record_screen_with_mic" ] && record_screen_with_mic && exit
  [ "$1" == "record_webcam_0" ] && record_webcam_0 && exit
  [ "$1" == "record_webcam_0_mic" ] && record_webcam_0_mic && exit
  [ "$1" == "record_webcam_2" ] && record_webcam_2 && exit
  [ "$1" == "record_webcam_2_mic" ] && record_webcam_2_mic && exit
  [ "$1" == "stream_webcam_0" ] && stream_webcam_0 && exit
  [ "$1" == "stream_webcam_2" ] && stream_webcam_2 && exit
  [ "$1" == "kill_webcam" ] && kill_webcam && exit
  [ "$1" == "keys_on" ] && keys_on && exit
  [ "$1" == "keys_off" ] && keys_off && exit
}

main "$@"

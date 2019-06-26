#!/usr/env/bin bash

function record_screen() {
  ffmpeg -f x11grab \
  -s $(xdpyinfo | grep dimension | awk '{print $2}') \
  -i :0.0 ~/Wideo/out.mkv
}

function record_screen_with_mic() {
  ffmpeg -f x11grab \
  -s $(xdpyinfo | grep dimension | awk '{print $2}') \
  -i :0.0 -f alsa -i default ~/Wideo/out.mkv
}

function record_web_cam() {
  ffmpeg -i /dev/video0 ~/Wideo/out.mkv
}

function record_web_cam_with_mic() {
  ffmpeg -i /dev/video0 -f alsa -i default ~/Wideo/out.mkv
}


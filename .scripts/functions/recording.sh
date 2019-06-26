#!/usr/env/bin bash

function recordScreen() {
  ffmpeg -f x11grab \
  -s $(xdpyinfo | grep dimension | awk '{print $2}') \
  -i :0.0 ~/Wideo/out.mkv
}

function recordScreenWithMic() {
  ffmpeg -f x11grab \
  -s $(xdpyinfo | grep dimension | awk '{print $2}') \
  -i :0.0 -f alsa -i default ~/Wideo/out.mkv
}

function recordWebCam() {
  ffmpeg -i /dev/video0 ~/Wideo/out.mkv
}

function recordWebCamWithMic() {
  ffmpeg -i /dev/video0 -f alsa -i default ~/Wideo/out.mkv
}


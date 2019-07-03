#!/usr/bin/env bash
source ~/.config/scripts/web.conf

function show_ip_ext {
  curl -s http://ipecho.net/plain | rev | cut -c 1- | rev
}

function show_weather_in() {
  curl -s http://wttr.in/"$1" | head -n 7 && printf "\n"
}

function ssh_linuxpl() {
  ssh -l $SSH_SERVER_LINUX_PL_USER \
      -p $SSH_SERVER_LINUX_PL_PORT \
      $SSH_SERVER_LINUX_PL
}

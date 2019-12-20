#!/usr/bin/env bash

if [ -f "$(pwd)/$1" ] ; then
  file="$(pwd)/$1"
else
  file="$1"
fi

gsettings set org.gnome.desktop.background picture-uri file://"$file"

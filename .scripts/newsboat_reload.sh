#!/usr/bin/env bash
newsboat -x reload
export DISPLAY=:0.0 && notify-send "rss feed reloaded"

#!/usr/bin/env bash
source $HOME/.config/scripts/personal.conf
$(ls -l ~/.scripts/work/play | awk '{print $9}' | tail -n+2 | dmenu -l 10)

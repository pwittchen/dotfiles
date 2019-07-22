#!/usr/bin/env bash
$(ls -l ~/.scripts/ | grep play | grep -v goto | awk '{print $9}' | dmenu -l 10)

#!/usr/bin/env bash
$(ls -l ~/.scripts/ | grep play | awk '{print $9}' | tail -n+2 | dmenu -l 10)

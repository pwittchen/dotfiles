#!/usr/bin/env bash
$(ls -l ~/.scripts/ | grep play | awk '{print $9}' | dmenu -l 10)

#!/usr/bin/env bash
 $(ls -l ~/.scripts | awk '{print $9}' | sed '/^$/d' | dmenu -l 15)

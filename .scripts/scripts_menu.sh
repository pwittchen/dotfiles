#!/usr/bin/env bash
 $(ls -l ~/.scripts | awk '{print $8}' | sed '/^$/d' | dmenu -l 15)

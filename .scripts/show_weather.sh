#!/usr/bin/env bash
curl -s http://wttr.in/"$1" | head -n 7 && printf "\n"

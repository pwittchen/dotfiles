#!/usr/bin/env bash
mpstat | awk '$12 ~ /[0-9.]+/ { print "CPU " 100 - $12"%" }'

#!/usr/bin/env bash
# $1 = APname, $2 = password
nmcli device wifi connect $1 $2

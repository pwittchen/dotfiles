#!/usr/bin/env bash
ps -ax | grep screenkey | grep -v grep | awk '{print $1}' | xargs kill -9

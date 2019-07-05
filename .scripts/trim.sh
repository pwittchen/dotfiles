#!/usr/bin/env bash
awk '{gsub(/^ +| +$/,\"\")}1'

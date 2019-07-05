#!/usr/bin/env bash
# params: $1 = dir, $2 = program to execute
cd $1
fzf_out=$(fzf)
if [ "$fzf_out" != "" ]; then
  sudo $2 $fzf_out
fi
cd -

#!/usr/bin/env bash
# params: $1 = dir, $2 = file to open
cd $1
out=$(fzf)
if [ "$out" != "" ]; then
  if [[ "$out" == *".jpg"*  ]] || [[ "$out" == *".png"*  ]] || [[ "$out" == *".gif"*  ]] ; then
    sxiv $out
    exit
  elif [[ "$out" == *".pdf"*  ]] ; then
    zathura $out
  else
    vim $out
  fi
fi
cd -

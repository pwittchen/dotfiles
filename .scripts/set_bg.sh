#!/usr/bin/env bash

function setbg {
  cp $1 ~/.config/wall.jpg
  DISPLAY=:0.0 feh --bg-scale ~/.config/wall.jpg
  notify-send "wallpaper changed"
}

function setrandombg {
  if [ -z "$1" ] ; then
    dir=$(ls -d ~/pictures/wallpapers/*/ | shuf | head -n1)
  else
    dir=$1/
  fi
  file=$(ls $dir | shuf | head -n1)
  if [[ "$file" == *".jpg"* ]] || [[ "$file" == *".png"* ]] ; then
    setbg $dir$file
  else
    setrandombg
  fi
}

function setdaytimebg {
  hour=$(date +%H)
  daytime=$(sunwait poll 50.2849923N 18.6493647E)
  if [[ $daytime == "DAY" ]] && [ $hour -lt 12 ] ; then
    setbg $1 # morning
  elif [ $hour -gt 11 ] && [ $hour -lt 15 ] ; then
    setbg $2 # midday
  elif [ $hour -gt 14 ] && [[ $daytime == "DAY" ]] ; then
    setbg $3 # dusk
  elif [[ $daytime == "NIGHT" ]] ; then
    setbg $4 # night
  fi
}

function help {
    echo "
    setbg.sh is a simple script for setting wallpapers

    usage:

    setbg.sh <filename>                                  sets given filename (*.jpg or *.png) as a wallpaper
    setbg.sh random                                      sets random wallpaper
    setbg.sh random <dir>                                sets random wallpaper from files in given dir
    setbg.sh daytime <morning> <midday> <dawn> <night>   sets different wallpaper according to time of the day
    "
}

function main {
  if [ -z "$1" ] || [ "$1" == "help" ] ; then
    help
    exit
  fi
  if [[ "$1" == *".jpg"* ]] || [[ "$1" == *".png"* ]] ; then
    setbg $1
    exit
  fi
  if [ "$1" == "random" ] ; then
    setrandombg $2
    exit
  fi
  if [ "$1" == "daytime" ] ; then
    setdaytimebg $2 $3 $4 $5
    exit
  fi

}

main "$@"

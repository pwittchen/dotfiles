#!/usr/bin/env bash

function setbg {
  cp $1 ~/.config/wall.jpg
  export DISPLAY=:0.0 && feh --bg-scale ~/.config/wall.jpg
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
  time_of_day=$(sunwait poll 50.2849923N 18.6493647E)
  [[ $time_of_day == "DAY" ]] && [ $hour -lt 12 ] && setbg $1 # morning
  [ $hour -gt 11 ] && [ $hour -lt 15 ]            && setbg $2 # midday
  [ $hour -gt 14 ] && [[ $time_of_day == "DAY" ]] && setbg $3 # dusk
  [[ $time_of_day == "NIGHT" ]]                   && setbg $4 # night
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

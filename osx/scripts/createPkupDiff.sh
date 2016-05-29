#!/usr/bin/env bash

# Creates diffs with my changes in code from the last month for PKUP report
# PKUP stands for "Podwyższone Koszty Uzyskania Przychodu" in Polish

# TODO:
# - update it to generate diffs from 20th day of previous month - not last 20 days
# - generate report in *.doc file (consider external python script)
# - parametrize this script to make it generic

set -e

# info about developer
surname=Wittchen
name=Piotr

# info about destination directory and files
dateFormat=$(date +'%Y%m')
filePath=~/Documents/hybris/pkup/raporty/doc/"$surname"_"$name"_"$dateFormat"
fileExtension=diff

msg() {
  tput setaf 2 # green text
  echo ">>> $1"
  tput sgr 0
  sleep 1
}

saveDiff() {
  msg "saving diff for $1"
  cd $yHYBRIS_SRC/"$1"
  gitUserName=$(git config user.name)
  mkdir -p "$filePath"
  git log --author="$gitUserName" -p --since="20 days" > "$filePath"/"$1"."$fileExtension"
}

removeDiffIfEmpty() {
  if [ ! -s "$filePath"/"$1"."$fileExtension" ]
  then
    msg "no changes performed in $1 -> removing empty $1.$fileExtension file"
    rm -f "$filePath"/"$1".$fileExtension
  fi
}

main() {
  projects=(backoffice platform-backoffice cockpitng)

  for project in "${projects[@]}"
  do
    saveDiff $project
    removeDiffIfEmpty $project
  done
}

main "$@"

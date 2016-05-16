#!/usr/bin/env bash

# Creates diffs with my changes in code from the last month for PKUP report
# PKUP stands for "Podwyższone Koszty Uzyskania Przychodu" in Polish

# TODO:
# - update it to generate diffs from 20th day of previous month - not last 20 days
# - generate report in *.doc file (consider external python script)
# - parametrize this script to make it generic

set -e

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
  dateFormat=$(date +'%Y%m')
  filePath=Documents/hybris/pkup/raporty/doc/Wittchen_Piotr_"$dateFormat"
  mkdir -p ~/"$filePath"
  git log --author="$gitUserName" -p --since="20 days ago" > ~/"$filePath"/"$1".diff
}

removeDiffIfEmpty() {
  dateFormat=$(date +'%Y%m')
  filePath=Documents/hybris/pkup/raporty/doc/Wittchen_Piotr_"$dateFormat"

  if [ ! -s ~/"$filePath"/"$1".diff ]
  then
    msg "no changes performed in $1 -> removing empty $1.diff file"
    rm -f ~/"$filePath"/"$1".diff
  fi
}

main() {
  saveDiff backoffice
  saveDiff platform-backoffice
  saveDiff cockpitng

  removeDiffIfEmpty backoffice
  removeDiffIfEmpty platform-backoffice
  removeDiffIfEmpty cockpitng
}

main "$@"

#!/usr/bin/env bash

# Creates diffs with my changes in code from the last month for PKUP report
# PKUP stands for "Podwyższone Koszty Uzyskania Przychodu" in Polish

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
  mkdir -p ~/Documents/hybris/pkup/raporty/doc/Wittchen_Piotr_"$dateFormat"
  filePath=Documents/hybris/pkup/raporty/doc/Wittchen_Piotr_"$dateFormat"
  git log --author="$gitUserName" -p --since="20 days ago" > ~/"$filePath"/"$1".diff
}

main() {
  saveDiff backoffice
  saveDiff platform-backoffice
  saveDiff cockpitng
}

main "$@"

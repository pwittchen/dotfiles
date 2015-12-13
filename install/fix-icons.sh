#!/usr/bin/env bash

set -e # tells bash, in a script, to exit whenever anything returns a non-zero return value

msg() {
    tput setab 2 # green bg
    tput setaf 7 # white text
    echo ">>> $1"
    tput sgr 0
    sleep 1
}

main() {
  msg "-------- fixing bad looking indicator icons --------"
  msg "fixing Spotify icon"
  sh -c "$(wget https://raw.githubusercontent.com/faviouz/fix-spotify-icon/master/install.sh -O -)"
  fix-spotify-icon
  msg "fixing Skype icon"
  curl https://raw.githubusercontent.com/pwittchen/fix-skype-icon/master/fix-skype-icon.sh | sh
  msg "DONE!"
}

main "$@" # "$@" is an array-like construct of all positional parameters, {$1, $2, $3 ...}

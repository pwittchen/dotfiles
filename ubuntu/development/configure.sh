#!/usr/bin/env bash

set -e # tells bash, in a script, to exit whenever anything returns a non-zero return value

msg() {
    tput setab 2 # green bg
    tput setaf 7 # white text
    echo "$1"
    tput sgr 0
    sleep 1
}

main() {
  # you can setup your own paths below
  export PATH_TO_ANDROID_STUDIO=$HOME/Development/android/android-studio
  export PATH_TO_INTELLIJ_IDEA=$HOME/Development/jvm/idea-ce
  export PATH_TO_PYCHARM=$HOME/Development/python/pycharm-ce

  msg "copying run scripts to development directories"
  cp run-studio.sh $PATH_TO_ANDROID_STUDIO/bin/run-studio.sh
  cp run-idea.sh $PATH_TO_INTELLIJ_IDEA/bin/run-idea.sh
  cp run-pycharm.sh $PATH_TO_PYCHARM/bin/run-pycharm.sh

  msg "DONE!"
}

main "$@" # "$@" is an array-like construct of all positional parameters, {$1, $2, $3 ...}

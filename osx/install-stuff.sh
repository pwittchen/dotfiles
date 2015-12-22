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
  msg "-------- downloading and installing useful software --------"

  msg "installing homebrew"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

  msg "installing wget and curl"
  brew install wget curl

  msg "installing zsh"
  brew install zsh zsh-completions
  chsh -s /bin/zsh # settin zsh as default shell
  msg "installing oh-my-zsh"
  curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

  msg "installing Ant, Maven and Gradle"
  brew install ant maven gradle

  msg "downloading JDK 7, 8, 9"
  wget http://download.oracle.com/otn-pub/java/jdk/7u79-b15/jdk-7u79-macosx-x64.dmg
  wget http://download.oracle.com/otn-pub/java/jdk/8u65-b17/jdk-8u65-macosx-x64.dmg
  wget http://www.java.net/download/jdk9/archive/96/binaries/jdk-9-ea+96_osx-x64_bin.dmg
  msg "JDKs downloaded - remember to install them manually!"

  msg "DONE!"
}

main "$@" # "$@" is an array-like construct of all positional parameters, {$1, $2, $3 ...}

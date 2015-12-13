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

  msg "installing zsh"
  sudo apt-get install zsh

  msg "installing oh-my-zsh"
  sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

  msg "installing python-pygments for colorize terminal command"
  sudo apt-get install python-pygments

  msg "installing Git"
  sudo apt-get install git

  msg "Installing Java 7, 8 and 9"
  sudo add-apt-repository ppa:webupd8team/java -y
  sudo apt-get update
  sudo apt-get install oracle-java7-installer
  sudo apt-get install oracle-java8-installer
  sudo apt-get install oracle-java9-installer

  msg "Setting Java 8 as default JVM"
  sudo apt-get install oracle-java8-set-default

  msg "installing font fix for Open JDK"
  sudo add-apt-repository ppa:no1wantdthisname/openjdk-fontfix
  sudo apt-get update
  sudo apt-get install openjdk-7-jdk
  sudo apt-get install openjdk-8-jdk

  msg "installing Node.js"
  sudo apt-get install nodejs

  msg "installing Php 5"
  sudo apt-get install php5

  msg "installing Go"
  msg apt-get install golang

  msg "installing R"
  sudo apt-get install r-base

  msg "installing Haskell"
  sudo apt-get install haskell-platform

  msg "installing Chrome"
  sudo apt-get install libxss1 libappindicator1 libindicator7
  wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
  sudo dpkg -i google-chrome*.deb
  sudo rm google-chrome*.deb

  msg "installing Atom.io"
  wget https://atom.io/download/deb
  sudo dpkg -i *.deb
  sudo rm *.deb

  msg "installing dmenu"
  sudo apt-get install dmenu

  msg "installing Geary e-mail client"
  sudo apt-get install geary

  msg "installing California desktop calendar"
  sudo add-apt-repository ppa:yorba/daily-builds
  sudo apt-get update && sudo apt-get install california

  msg "installing Spotify"
  sudo sh -c 'echo "deb http://repository.spotify.com/ stable non-free" > /etc/apt/sources.list.d/spotify.list'
  sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 94558F59
  sudo apt-get update
  sudo apt-get install spotify-client

  msg "installing Transmission (torrent client)"
  sudo apt-get install transmission

  msg "installing Gthumb - images browser and editor"
  sudo apt-get install gthumb

  msg "installing Pinta - image editor"
  sudo apt-get install pinta

  msg "installing Gimp"
  sudo apt-get install gimp

  msg "installing VLC"
  sudo apt-get install vlc browser-plugin-vlc

  msg "installing Furious ISO Mount"
  sudo apt-get install furiusisomount

  msg "installing tmux"
  sudo apt-get install tmux

  msg "installing xdotool"
  sudo apt-get install xdotool

  msg "-------- installing indicators --------"

  msg "installing mutliload indicator"
  sudo add-apt-repository ppa:indicator-multiload/stable-daily
  sudo apt-get update
  sudo apt-get install indicator-multiload

  msg "installing sensors indicator"
  sudo add-apt-repository ppa:alexmurray/indicator-sensors
  sudo apt-get update
  sudo apt-get install indicator-sensors

  msg "installing my weather indicator"
  sudo add-apt-repository ppa:atareao/atareao
  sudo apt-get update
  sudo apt-get install my-weather-indicator

  msg "installing caffeine indicator"
  sudo add-apt-repository ppa:caffeine-developers/ppa
  sudo apt-get update
  sudo apt-get install caffeine

  msg "-------- indicators installed! --------"

  msg "-------- installing system optimizers --------"

  msg "removing unwanted lenses from dashboard"
  sudo apt-get autoremove unity-lens-music unity-lens-photos unity-lens-gwibber unity-lens-shopping unity-lens-video

  msg "installing Compiz Config Settings Manager"
  sudo apt-get install compizconfig-settings-manager
  msg "remember to do the following things after installation of Compiz Config Settings Manager"
  msg "1. Disable Animations and Fading windows"
  msg "2. Set the Texture Filter to 'Fast'"

  msg "installing Preload"
  sudo apt-get install preload

  msg "-------- system optimizers installed! --------"

  msg "installing Dropbox" # should be done in the and, because we download stuff to ~
  cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
  sudo apt-get install nautilus-dropbox

  msg "DONE!"
}

main "$@" # "$@" is an array-like construct of all positional parameters, {$1, $2, $3 ...}

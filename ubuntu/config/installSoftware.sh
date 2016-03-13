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
  msg "downloading and installing useful software"

  sudo add-apt-repository ppa:webupd8team/java -y # JDK from Oracle
  sudo add-apt-repository ppa:no1wantdthisname/openjdk-fontfix # open JDK with font fix
  sudo add-apt-repository ppa:yorba/daily-builds # california calendar
  sudo add-apt-repository ppa:indicator-multiload/stable-daily #indicator-multiload
  sudo add-apt-repository ppa:alexmurray/indicator-sensors # indicator-sensors
  sudo add-apt-repository ppa:atareao/atareao # my-weather-indicator

  # preparing for installation of spotify
  sudo sh -c 'echo "deb http://repository.spotify.com/ stable non-free" > /etc/apt/sources.list.d/spotify.list'
  sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 94558F59

  sudo apt-get update

  sudo apt-get install git zsh python-pygments oracle-java7-installer oracle-java8-installer oracle-java9-installer openjdk-7-jdk openjdk-8-jdk oracle-java8-set-default nodejs php5 golang r-base haskell-platform libxss1 libappindicator1 libindicator7 dmenu geary california transmission gthumb pinta gimp vlc browser-plugin-vlc furiusisomount tmux xdotool spotify-client indicator-multiload indicator-sensors my-weather-indicator compizconfig-settings-manager preload nautilus-dropbox

  msg "installing Chrome"
  wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
  sudo dpkg -i *.deb
  sudo rm *.deb

  msg "installing Atom.io"
  wget https://atom.io/download/deb
  sudo dpkg -i *.deb
  sudo rm *.deb

  msg "installing oh-my-zsh"
  sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

  msg "removing unwanted lenses from dashboard"
  sudo apt-get autoremove unity-lens-music unity-lens-photos unity-lens-gwibber unity-lens-shopping unity-lens-video

  msg "DONE!"
}

main "$@" # "$@" is an array-like construct of all positional parameters, {$1, $2, $3 ...}

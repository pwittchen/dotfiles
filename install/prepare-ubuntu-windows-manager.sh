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
  msg "installing Gnome 2 Classic Session Fallback"
  sudo apt-get install gnome-session-fallback

  msg "installing gnome tweak tool and unity tweak tool"
  sudo apt-get install gnome-tweak-tool unity-tweak-tool

  msg "installing compiz config manager with plugins"
  sudo apt-get install compizconfig-settings-manager compiz-plugins-extra
  msg "-------- information about system UI configuration --------"
  msg "to enable alt+tab in gnome classic fallback, open the manager and navigate to window management"
  msg "check application switcher (previously disabled)"
  msg "to set number of workspaces, open CompizConfig Settings Manager and go to: General Options -> Desktop Size"
  msg "to configure look of the windows, go to Effects -> Window Decoration"
  msg "-------- end of information about system UI configuration --------"

  msg "installing Numix theme and icons for Gnome"
  sudo add-apt-repository ppa:numix/ppa
  sudo apt-get update
  sudo apt-get install numix-gtk-theme numix-icon-theme numix-icon-theme-circle

  msg "DONE!"

  msg "PLEASE NOTE: remaining configuration and rebooting have to be performed manually"
  msg "Please, reboot system, change windows manager to Gnome Flashback (Compiz) and log in back"
  msg "Then, set Numix theme and circle icons for Gnome with Gnome/Unity Tweak Tool"
}

main "$@" # "$@" is an array-like construct of all positional parameters, {$1, $2, $3 ...}

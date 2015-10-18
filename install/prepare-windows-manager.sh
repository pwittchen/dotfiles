#!/bin/bash

# PLEASE NOTE: this script may not install everything at once
# probably you will be ogligated to install everything separately
# moreover, some actions described in comments have to be performed manually

# install Gnome 2 Classic Session Fallback
sudo apt-get install gnome-session-fallback

# install gnome tweak tool and unity tweak tool
sudo apt-get install gnome-tweak-tool unity-tweak-tool

# install compiz config manager with plugins
sudo apt-get install compizconfig-settings-manager compiz-plugins-extra

# to enable alt+tab in gnome classic fallback, open the manager and navigate to window management
# check application switcher (previously disabled)

# to set number of workspaces, open CompizConfig Settings Manager and go to: General Options -> Desktop Size

# install Numix theme and icons for Gnome

sudo add-apt-repository ppa:numix/ppa
sudo apt-get update
sudo apt-get install numix-gtk-theme numix-icon-theme numix-icon-theme-circle

# remaining configuration have to be performed manually

echo "Please, reboot system, change windows manager to Gnome Flashback (Compiz) and log in back"
echo "Then, Numix theme and circle icons for Gnome with Gnome Tweak Tool"


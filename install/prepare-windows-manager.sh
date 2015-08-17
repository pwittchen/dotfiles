#!/bin/bash
# install Gnome 2 Classic Session Fallback
sudo apt-get install gnome-session-fallback

# install gnome tweak tool and unity tweak tool
sudo apt-get install gnome-tweak-tool unity-tweak-tool

# install Numix theme and icons for Gnome

sudo add-apt-repository ppa:numix/ppa
sudo apt-get update
sudo apt-get install numix-gtk-theme numix-icon-theme numix-icon-theme-circle

# remaining configuration have to be performed manually

echo "Please, reboot system, change windows manager to Gnome Flashback (Compiz) and log in back"
echo "Then, Numix theme and circle icons for Gnome with Gnome Tweak Tool"


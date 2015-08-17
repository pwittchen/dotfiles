#!/bin/bash

# PLEASE NOTE: this script may not install everything at once
# probably you will be obligated to install each program separately

echo "downloading and installing useful software..."

echo "installing zsh"

sudo apt-get install zsh

echo "installing oh-my-zsh"

sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

echo "installing python-pygments for colorize terminal command"

sudo apt-get install python-pygments

echo "installing Git"

sudo apt-get install git

echo "Installing Java 7, 8 and 9"

sudo add-apt-repository ppa:webupd8team/java -y
sudo apt-get update
sudo apt-get install oracle-java7-installer
sudo apt-get install oracle-java8-installer
sudo apt-get install oracle-java9-installer

echo "Setting Java 8 as default JVM"

sudo apt-get install oracle-java8-set-default

echo "installing font fix for Open JDK"

sudo add-apt-repository ppa:no1wantdthisname/openjdk-fontfix
sudo apt-get update
sudo apt-get install openjdk-7-jdk
sudo apt-get install openjdk-8-jdk

#jaytana is useful only for Unity WM
#echo "Installing jayatana - HUD support for Swing applications"

#sudo add-apt-repository ppa:danjaredg/jayatana
#sudo apt-get update
#sudo apt-get install jayatana

echo "installing Node.js"

sudo apt-get install nodejs

echo "installing Php 5"

sudo apt-get install php5

echo "installing Go"

sudo apt-get install golang

echo "installing R"

sudo apt-get install r-base

echo "installing Haskell"

sudo apt-get install haskell-platform

echo "installing Chrome"

sudo apt-get install libxss1 libappindicator1 libindicator7

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome*.deb
sudo rm google-chrome*.deb # removing installer package

echo "installing dmenu"
sudo apt-get install dmenu

# uncomment if you want to use Mutate
#echo "installing Mutate"
#sudo add-apt-repository ppa:mutate/ppa
#sudo apt-get update
#sudo apt-get install mutate

echo "installing Spotify"

sudo sh -c 'echo "deb http://repository.spotify.com/ stable non-free" > /etc/apt/sources.list.d/spotify.list'
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 94558F59
sudo apt-get update
sudo apt-get install spotify-client

echo "installing Transmission (torrent client)"

sudo apt-get install transmission

echo "installing Gthumb - images browser and editor"

sudo apt-get install gthumb

echo "installing Pinta - image editor"

sudo apt-get install pinta

echo "installing Gimp"

sudo apt-get install gimp

echo "installing VLC"

sudo apt-get install vlc browser-plugin-vlc

echo "installing Furious ISO Mount"

sudo apt-get install furiusisomount

echo "installing drivers for Logitech H760 Wireless Headset"

sudo add-apt-repository ppa:ubuntu-audio-dev/ppa
sudo apt-get update
sudo apt-get dist-upgrade -y

# installing indicators - begin

echo "installing mutliload indicator"

sudo add-apt-repository ppa:indicator-multiload/stable-daily
sudo apt-get update
sudo apt-get install indicator-multiload

echo "installing sensors indicator"

sudo add-apt-repository ppa:alexmurray/indicator-sensors
sudo apt-get update
sudo apt-get install indicator-sensors

echo "installing my weather indicator"

sudo add-apt-repository ppa:atareao/atareao
sudo apt-get update
sudo apt-get install my-weather-indicator

# installing indicators - end

# system optimization - begin

echo "removing unwanted lenses from dashboard"

sudo apt-get autoremove unity-lens-music unity-lens-photos unity-lens-gwibber unity-lens-shopping unity-lens-video

echo "installing Compiz Config Settings Manager"

sudo apt-get install compizconfig-settings-manager

echo "remember to do the following things after installation of Compiz Config Settings Manager"
echo "1. Disable Animations and Fading windows"
echo "2. Set the Texture Filter to 'Fast'"

echo "installing Preload"

sudo apt-get install preload

# system optimization - end

echo "installing Dropbox" # should be done in the and, because we download stuff to ~

cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
#sudo apt-get install libappindicator1 # was installed earlier
sudo apt-get install nautilus-dropbox



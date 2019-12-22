#!/usr/bin/env bash

YEAR=$(date +"%Y")
FINANCE_DIR="~/Documents/finance/budzet/$YEAR"

alias scs="cd ~/.scripts                  && l"
alias dvp="cd ~/Development               && l"
alias dox="cd ~/Documents                 && l"
alias dld="cd ~/Downloads                 && l"
alias pix="cd ~/Pictures                  && l"
alias vid="cd ~/Videos                    && l"
alias mus="cd ~/Music                     && l"
alias dtf="cd ~/Development/bash/dotfiles && l"
alias wlp="cd ~/Pictures/wallpapers       && l"
alias kzm="libreoffice $FINANCE_DIR/koszty-zmienne.ods &"
alias kst="libreoffice $FINANCE_DIR/koszty-stale.ods &"
alias bdt="libreoffice $FINANCE_DIR/budzet.ods &"
alias sound_control="pavucontrol"
alias wifi_list="nmcli dev wifi"
alias monitor_list="xrandr --listmonitors"
alias turn_off_laptop_monitor="xrandr --output eDP-1 --off"
alias reset_monitors="xrandr --auto"
alias reload_wallpaper="feh --bg-scale ~/Pictures/wallpapers/mountains/bw-mountain-clouds.jpg"

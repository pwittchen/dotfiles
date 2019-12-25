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
alias sct="pavucontrol"
alias mls="xrandr --listmonitors"
alias mlo="xrandr --output eDP-1 --off"
alias mrl="xrandr --output eDP-1 --mode 1920x1080 --output HDMI-2 --mode 1920x1080 --same-as eDP-1"
alias mrr="xrandr --auto"
alias wlr="feh --bg-scale ~/Pictures/wallpapers/mountains/bw-mountain-clouds.jpg"

#!/usr/bin/env bash

YEAR=$(date +"%Y")
FINANCE_DIR="~/documents/finance/budzet/$YEAR"

alias scs="cd ~/.scripts                  	&& l"
alias dvp="cd ~/development                     && l"
alias dox="cd ~/documents                 	&& l"
alias dld="cd ~/downloads                 	&& l"
alias pix="cd ~/pictures                  	&& l"
alias vid="cd ~/videos                   	&& l"
alias dtf="cd ~/development/prv/bash/dotfiles 	&& l"
alias wlp="cd ~/pictures/wallpapers       	&& l"
alias kzm="libreoffice $FINANCE_DIR/koszty-zmienne.ods &"
alias kst="libreoffice $FINANCE_DIR/koszty-stale.ods &"
alias bdt="libreoffice $FINANCE_DIR/budzet.ods &"
alias sct="pavucontrol"
alias mnt_usb="sudo mount /dev/sdb1 /media/usb"
alias umt_usb="sudo umount /media/usb"

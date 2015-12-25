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
    msg "starting system configuration"
    source ./scripts/copy-stuff.sh
    source ./scripts/install-stuff.sh
    source ./scripts/prepare-windows-manager.sh
    source ./scripts/fix-icons.sh
    msg "DONE! System configuration finished!"
}

main "$@" # "$@" is an array-like construct of all positional parameters, {$1, $2, $3 ...}
#!/usr/bin/env bash
# params: [YES|NO]
defaults write com.apple.finder AppleShowAllFiles $1 && sudo killall Finder

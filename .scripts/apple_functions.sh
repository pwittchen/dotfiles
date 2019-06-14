#!/usr/bin/env bash

function makeFilesVisible() {
  defaults write com.apple.finder AppleShowAllFiles $1 && sudo killall Finder
}

#!/usr/bin/env bash

alias mc="mc -a -S modarin256-defbg"

function makeFilesVisible() {
  defaults write com.apple.finder AppleShowAllFiles $1 && sudo killall Finder
}

function showHiddenFiles {
  makeFilesVisible YES
}

function hideHiddenFiles {
  makeFilesVisible NO
}

function restartMenuBar() {
  killall -KILL SystemUIServer
}


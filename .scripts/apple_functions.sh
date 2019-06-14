#!/usr/bin/env bash

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


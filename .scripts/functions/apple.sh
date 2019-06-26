#!/usr/bin/env bash

alias mc="mc -a -S modarin256-defbg"

function make_files_visible() {
  defaults write com.apple.finder AppleShowAllFiles $1 && sudo killall Finder
}

function show_hidden_files {
  makeFilesVisible YES
}

function hide_hidden_files {
  makeFilesVisible NO
}

function restart_status_bar() {
  killall -KILL SystemUIServer
}


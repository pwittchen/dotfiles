#!/usr/bin/env bash

function cutLastChars() {
  numberOfCharsToCut=$1
  numberOfCharsToCut=$[numberOfCharsToCut+1];
  rev | cut -c $numberOfCharsToCut- | rev
}

function reloadTmux() {
  tmux source-file ~/.tmux.conf
}

function reloadShell {
  source ~/.zshrc
}

function prettyJson() {
  python3 -m json.tool
}

function trim() {
  awk '{gsub(/^ +| +$/,\"\")}1'
}

function runHttpServer() {
  python3 -m http.server 8000
}

function firstLine() {
  head -n1
}

function lastLine() {
  tail -n1
}

function excludeGrep() {
  grep -v grep
}

function hex2bin() {
  wcalc -d
}

function bin2hex() {
  wcalc -h
}

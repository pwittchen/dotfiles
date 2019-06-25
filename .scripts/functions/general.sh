#!/usr/bin/env bash

function cutLastChars() {
  numberOfCharsToCut=$1
  numberOfCharsToCut=$[numberOfCharsToCut+1];
  rev | cut -c $numberOfCharsToCut- | rev
}

function killAllDetachedScreenSessions() {
    screen -ls | grep Detached | cut -d. -f1 | awk '{print $1}' | xargs kill
}

function killScreen() {
    screen -X -S $1 quit
}

function showProcessStatsByPid() {
  ps -p $1 -o %cpu,%mem,cmd
}

function tea() {
  tee -a $1
}

function repeatOperation() {
  watch -n 1 $1 
}

function reloadTmux() {
  tmux source-file ~/.tmux.conf
}

function reloadShell {
  source ~/.zshrc
}

function prettyJson() {
  python -m json.tool
}

function trim() {
  awk '{gsub(/^ +| +$/,\"\")}1'
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

#!/usr/bin/env bash

function cut_last_chars() {
  numberOfCharsToCut=$1
  numberOfCharsToCut=$[numberOfCharsToCut+1];
  rev | cut -c $numberOfCharsToCut- | rev
}

function reload_tmux() {
  tmux source-file ~/.tmux.conf
}

function reload_shell {
  source ~/.zshrc
}

function pretty_json() {
  python3 -m json.tool
}

function trim() {
  awk '{gsub(/^ +| +$/,\"\")}1'
}

function run_http_server() {
  python3 -m http.server 8000
}

function first_line() {
  head -n1
}

function last_line() {
  tail -n1
}

function exclude_grep() {
  grep -v grep
}

function hex2bin() {
  wcalc -d
}

function bin2hex() {
  wcalc -h
}

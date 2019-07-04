#!/usr/bin/env bash

function cut_last_chars() {
  numberOfCharsToCut=$1
  numberOfCharsToCut=$[numberOfCharsToCut+1];
  rev | cut -c $numberOfCharsToCut- | rev
}

function reload_shell {
  source ~/.zshrc
  tmux source-file ~/.tmux.conf
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

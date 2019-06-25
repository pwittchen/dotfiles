#!/usr/bin/env bash

export PATH=$PATH:$HOME/anaconda3/bin

function runPythonHttpServer() {
  python3 -m http.server 8000
}

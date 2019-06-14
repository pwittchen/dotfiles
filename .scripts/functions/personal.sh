#!/usr/bin/env bash

PERSONAL_MACHINE_NAME="t470s"

function setupGitUserName() {
  git config --global user.name "Piotr Wittchen"
}

function setupGitPersonalEmail {
  git config --global user.email "piotr@wittchen.io"
}

function connectToLinuxPl() {
  ssh -l wittchen -p 59184 wittchen.linuxpl.info
}

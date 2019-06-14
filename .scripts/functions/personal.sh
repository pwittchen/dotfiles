#!/usr/bin/env bash

USER_NAME="Piotr Wittchen"
PERSONAL_EMAIL="piotr@wittchen.io"
PERSONAL_MACHINE="t470s"

function setupGitUserName() {
  git config --global user.name $USER_NAME
}

function setupGitPersonalEmail {
  git config --global user.email $PERSONAL_EMAIL
}

function connectToLinuxPl() {
  ssh -l wittchen -p 59184 wittchen.linuxpl.info
}

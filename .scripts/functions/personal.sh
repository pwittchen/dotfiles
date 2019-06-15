#!/usr/bin/env bash

source ~/.config/scripts/personal.conf

function setupGitUserName() {
  git config --global user.name $USER_NAME
}

function setupGitPersonalEmail {
  git config --global user.email $PERSONAL_EMAIL
}

function connectToLinuxPl() {
  ssh -l $SSH_SERVER_LINUX_PL_USER \
      -p $SSH_SERVER_LINUX_PL_PORT \
      $SSH_SERVER_LINUX_PL
}

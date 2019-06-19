#!/usr/bin/env bash

source ~/.config/scripts/personal.conf

function setupGitName() {
  git config --global user.name $USER_NAME
}

function setupGitEmail {
  git config --global user.email $USER_EMAIL
}

function connectToLinuxPl() {
  ssh -l $SSH_SERVER_LINUX_PL_USER \
      -p $SSH_SERVER_LINUX_PL_PORT \
      $SSH_SERVER_LINUX_PL
}

#!/usr/bin/env bash

function linuxpl {
  source ~/.config/scripts/linuxpl.conf
  ssh -l $SERVER_LINUX_PL_USER -p $SERVER_LINUX_PL_SSH_PORT $SERVER_LINUX_PL
}

function mikrus {
  source ~/.config/scripts/mikrus.conf
  ssh -l $SERVER_MIKRUS_USER -p $SERVER_MIKRUS_SSH_PORT $SERVER_MIKRUS
}

function help {
    echo "
    ssh_servers.sh is a wrapper script for connecting with servers via ssh

    defined servers:

    linuxpl
    mikrus
   "
}

function main {
  if [ -z "$1" ] || [ "$1" == "help" ] ; then
    help
    exit
  fi
  if [ "$1" == "linuxpl" ]; then
    linuxpl
    exit
  fi
  if [ "$1" == "mikrus" ]; then
    mikrus
    exit
  fi
}

main "$@"

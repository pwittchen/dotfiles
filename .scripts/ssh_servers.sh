#!/usr/bin/env bash

function linuxpl {
  source ~/.config/scripts/linuxpl.conf
  ssh -l $SERVER_LINUX_PL_USER -p $SERVER_LINUX_PL_SSH_PORT $SERVER_LINUX_PL
}

function help {
    echo "
    ssh_servers.sh is a wrapper script for connecting with servers via ssh

    defined servers:

      linuxpl
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
}

main "$@"

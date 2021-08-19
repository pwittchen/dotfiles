#!/usr/bin/env bash

function cyberfolks {
  source ~/.config/scripts/cyberfolks.conf
  ssh -l $SERVER_CYBERFOLKS_USER -p $SERVER_CYBERFOLKS_SSH_PORT $SERVER_CYBERFOLKS
}

function help {
    echo "
    ssh_servers.sh is a wrapper script for connecting with servers via ssh

    defined servers:

      cyberfolks
    "
}

function main {
  if [ -z "$1" ] || [ "$1" == "help" ] ; then
    help
    exit
  fi
  if [ "$1" == "cyberfolks" ]; then
    cyberfolks
    exit
  fi
}

main "$@"

#!/usr/bin/env bash
source ~/.config/scripts/linuxpl.conf

ssh -l $SERVER_LINUX_PL_USER \
    -p $SERVER_LINUX_PL_SSH_PORT \
    $SERVER_LINUX_PL

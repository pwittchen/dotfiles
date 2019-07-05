#!/usr/bin/env bash
source ~/.config/scripts/linuxpl.conf

ssh -l $SSH_SERVER_LINUX_PL_USER \
    -p $SSH_SERVER_LINUX_PL_PORT \
    $SSH_SERVER_LINUX_PL

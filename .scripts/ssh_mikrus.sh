#!/usr/bin/env bash
source ~/.config/scripts/mikrus.conf

ssh -l $SERVER_MIKRUS_USER -p $SERVER_MIKRUS_SSH_PORT $SERVER_MIKRUS

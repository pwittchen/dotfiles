#!/usr/bin/env bash
source $HOME/.config/scripts/personal.conf
cd $PLAY_BLD
ant clean all
./hybrisserver.sh debug
cd -

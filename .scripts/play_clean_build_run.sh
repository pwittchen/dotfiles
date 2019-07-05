#!/usr/bin/env bash
source $HOME/.config/scripts/enginiety.conf
cd $PLAY_BLD
ant clean all
./hybrisserver.sh debug
cd -

#!/usr/bin/env bash
source $HOME/.config/scripts/enginiety.conf
cd $PLAY_HYB
. ./setantenv.sh
ant clean all
cd -

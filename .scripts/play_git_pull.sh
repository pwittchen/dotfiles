#!/usr/bin/env bash
source $HOME/.config/scripts/enginiety.conf
cd $PLAY_GIT
git pull
git status -sb
cd -

#!/usr/bin/env bash
source $HOME/.config/scripts/personal.conf
cd $PLAY_GIT
git pull
git status -sb
cd -

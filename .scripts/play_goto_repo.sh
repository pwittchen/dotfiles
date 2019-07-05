#!/usr/bin/env bash
# this script needs to be called as follows: . play_go_to_repo.sh
source $HOME/.config/scripts/enginiety.conf
cd $PLAY_GIT
git status -sb

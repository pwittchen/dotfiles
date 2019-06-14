#!/usr/bin/env bash

current_dir=$(pwd)
echo "going into $1 directory"
cd $1
projects=($(ls -1 $1 | tr "\n" " " | rev | cut -c 1- | rev))
for project in "${projects[@]}"
  do
    echo "executing git $2 for $project"
    cd $1/$project
    git $2 || true
    echo "--------------------------"
done
echo "going back to $current_dir"
cd $current_dir

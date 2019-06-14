#!/usr/bin/env bash

function listAndroidEmulators() {
  emulator -list-avds
}

function runAndroidEmulator() {
  cd $ANDROID_HOME/emulator && emulator -use-system-libs -avd $(emulator -list-avds | sed -n 1p) && cd -
}

function showAndroidEmulatorServerIp() {
  echo "10.0.2.2"
}

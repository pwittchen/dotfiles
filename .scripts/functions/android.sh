#!/usr/bin/env bash

export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/emulator

function list_android_emulators() {
  emulator -list-avds
}

function run_android_emulator() {
  cd $ANDROID_HOME/emulator \
  && emulator -use-system-libs \
  -avd $(emulator -list-avds | sed -n 1p) \
  && cd -
}

function logcat_current() {
 adb logcat --current
}

function android_emulator_server_ip() {
  echo "10.0.2.2"
}

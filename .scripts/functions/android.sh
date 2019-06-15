#!/usr/bin/env bash

export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/emulator

function listAndroidEmulators() {
  emulator -list-avds
}

function runAndroidEmulator() {
  cd $ANDROID_HOME/emulator \
  && emulator -use-system-libs \
  -avd $(emulator -list-avds | sed -n 1p) \
  && cd -
}

function showLogsForCurrentApp() {
 adb logcat --current
}

function showAndroidEmulatorServerIp() {
  echo "10.0.2.2"
}

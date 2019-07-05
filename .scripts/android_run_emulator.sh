#!/usr/bin/env bash
cd $ANDROID_HOME/emulator \
&& emulator -use-system-libs \
-avd $(emulator -list-avds | sed -n 1p) \
&& cd -

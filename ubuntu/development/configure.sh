#!/usr/bin/env bash

set -e # tells bash, in a script, to exit whenever anything returns a non-zero return value

msg() {
    tput setab 2 # green bg
    tput setaf 7 # white text
    echo ">>> $1"
    tput sgr 0
    sleep 1
}

main() {
  # msg "-------- creating directories --------"
  # TODO: add code creating appropriate directory structure

  msg "-------- preparing Look & Feel of JetBrains IDEs --------"  

  msg "copying Darcula-modified theme to JetBrains IDEs directories"
  cp config/Darcula-modified.icls $HOME/.IdeaIC*/config/colors/
  cp config/Darcula-modified.icls $HOME/.AndroidStudio*/config/colors/
  cp config/Darcula-modified.icls $HOME/.PyCharm*/config/colors/

  msg "copying color scheme to JetBrains IDEs directories"
  cp config/color.scheme.xml $HOME/.IdeaIC*/config/options/color.scheme.xml
  cp config/color.scheme.xml $HOME/.AndroidStudio*/config/options/color.scheme.xml
  cp config/color.scheme.xml $HOME/.PyCharm*/config/options/color.scheme.xml

  msg "copying custom UI config to JetBrains IDEs directories"
  cp config/ui.inf.xml $HOME/.IdeaIC*/config/options/ui.inf.xml
  cp config/ui.inf.xml $HOME/.AndroidStudio*/config/options/ui.inf.xml
  cp config/ui.inf.xml $HOME/.PyCharm*/config/options/ui.inf.xml

  msg "copying run scripts to development directories"
  cp scripts/run-studio.sh $HOME/Development/android/android-studio/bin/run-studio.sh
  cp scripts/run-idea.sh $HOME/Development/jvm/idea-ce/bin/run-idea.sh
  cp scripts/run-pycharm.sh $HOME/Development/python/pycharm-ce/bin/run-pycharm.sh

  msg "DONE!"
}

main "$@" # "$@" is an array-like construct of all positional parameters, {$1, $2, $3 ...}

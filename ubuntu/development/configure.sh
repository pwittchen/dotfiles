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

  # you can setup your own paths below
  export PATH_TO_ANDROID_STUDIO=$HOME/Development/android/android-studio
  export PATH_TO_INTELLIJ_IDEA=$HOME/Development/jvm/idea-ce
  export PATH_TO_PYCHARM=$HOME/Development/python/pycharm-ce

  msg "copying run scripts to development directories"
  cp scripts/run-studio.sh $PATH_TO_ANDROID_STUDIO/bin/run-studio.sh
  cp scripts/run-idea.sh $PATH_TO_INTELLIJ_IDEA/bin/run-idea.sh
  cp scripts/run-pycharm.sh $PATH_TO_PYCHARM/bin/run-pycharm.sh

  msg "DONE!"
}

main "$@" # "$@" is an array-like construct of all positional parameters, {$1, $2, $3 ...}

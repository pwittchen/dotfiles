#!/bin/sh

# Prepare look and feel of IntelliJ IDEA, Android Studio and Pycharm

cp ui-config/Darcula-modified.icls $HOME/.IdeaIC14/config/colors/
cp ui-config/Darcula-modified.icls $HOME/.AndroidStudio1.3/config/colors/
cp ui-config/Darcula-modified.icls $HOME/.PyCharm40/config/colors/

cp ui-config/color.scheme.xml $HOME/.IdeaIC14/config/options/color.scheme.xml
cp ui-config/color.scheme.xml $HOME/.AndroidStudio1.3/config/options/color.scheme.xml
cp color.scheme.xml $HOME/.PyCharm40/config/options/color.scheme.xml

cp ui-config/ui.inf.xml $HOME/.IdeaIC14/config/options/ui.inf.xml
cp ui-config/ui.inf.xml $HOME/.AndroidStudio1.3/config/options/ui.inf.xml
cp ui-config/ui.inf.xml $HOME/.PyCharm40/config/options/ui.inf.xml

# Copy run scripts to development directories

cp run-scripts/android-studio/run-studio.sh $HOME/Development/android/android-studio/bin/run-studio.sh
cp run-scripts/idea-ce/run-idea.sh $HOME/Development/jvm/idea-ce/bin/run-idea.sh
cp run-scripts/pycharm-ce/run-pycharm.sh $HOME/Development/python/pycharm-ce/bin/run-pycharm.sh


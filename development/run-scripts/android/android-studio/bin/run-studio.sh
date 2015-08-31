#!/bin/sh
# change to your location
ANDROID_STUDIO_HOME=$HOME/Development/android/android-studio
export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64

# Note: Can modify $ANDROID_STUDIO_HOME/bin/studio{,64}.vmoptions
# instead of setting here.
# "-Dawt.useSystemAAFontSettings=on" seems worse to me
# "-Dsun.java2d.xrender=true" makes fonts darker
export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=lcd \
                      -Dsun.java2d.xrender=true \
                      -Dswing.aatext=true \
		      -Dsun.java2d.pmoffscreen=false"
# Having this set makes menu font size smaller (wtf?)
export GNOME_DESKTOP_SESSION_ID=this-is-deprecated
# unset GNOME_DESKTOP_SESSION_ID
exec $ANDROID_STUDIO_HOME/bin/studio.sh "$@" 

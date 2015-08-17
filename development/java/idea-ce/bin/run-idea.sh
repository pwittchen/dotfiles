#!/bin/sh
# change to your location
IDEA_HOME=$HOME/Development/java/idea-ce
export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64

# Note: Can modify $IDEA_HOME/bin/idea{,64}.vmoptions
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
exec $IDEA_HOME/bin/idea.sh "$@" 

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="minimal"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git colorize brew mvn gradle pip sudo)

# User configuration

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# setup for Ubuntu Linux used at home
if [ `uname` = "Linux" ]; then
  # right now, I'm using tmux only on Linux
  [[ $TERM != "screen" ]] && exec tmux

  alias resetGnomePanel="sudo killall gnome-panel"
  alias pbcopy='xsel --clipboard --input'
  alias pbpaste='xsel --clipboard --output'
  alias mc="mc -b" # midnight commander without colors

  # system info
  alias countCpus='cat /proc/cpuinfo | grep "physical id" | sort -u | wc -l'
  alias countCores='cat /proc/cpuinfo | grep "siblings" | sort -u | cut -d: -f2'
  alias countTotalRam="grep MemTotal /proc/meminfo"
  alias countFreeRam="grep MemFree /proc/meminfo"
  alias countTotalSwap="grep SwapTotal /proc/meminfo"

  # network info
  alias showNeighbourhood="sudo neighbourhood"

  # raspberry pi
  alias connectToPi="ssh pi@10.10.140.102"

  # development directory
  export DEV=$HOME/Development

  # java
  export JAVA_HOME=/usr/lib/jvm/java-8-oracle
  export PATH=$JAVA_HOME/bin:$PATH
  alias switchJava="sudo update-alternatives --config java"

  # android
  export ANDROID_HOME=$DEV/android/android-sdk
  export PATH=$PATH:$ANDROID_HOME/platform-tools
  export PATH=$PATH:$ANDROID_HOME/tools

  # scala
  export SCALA_HOME=/usr/share/scala
  export PATH=$SCALA_HOME/bin:$PATH

  # go
  export PATH=/usr/local/go/bin:$PATH
  export GOPATH=$DEV/go/workspace
  export GOBIN=$GOPATH/bin
  export PATH=$GOBIN:$PATH

  # swift
  export PATH=$DEV/swift/swift/usr/bin:$PATH

  # smalltalk
  alias gnu-smalltalk="/usr/bin/gst"  
fi

# setup for OS X used at work
if [ `uname` = "Darwin" ]; then
  # aliases for switching java version
  alias setJdk7='export JAVA_HOME=$(/usr/libexec/java_home -v 1.7)'
  alias setJdk8='export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)'
  alias setJdk9='export JAVA_HOME=$(/usr/libexec/java_home -v 1.9)'

  # set current java version and JAVA_HOME
  export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)

  # showing and hiding hidden files
  alias showHiddenFiles="defaults write com.apple.finder AppleShowAllFiles YES && sudo killall Finder"
  alias hideHiddenFiles="defaults write com.apple.finder AppleShowAllFiles NO && sudo killall Finder"

  # hybris settings (contains local env variables)
  source $HOME/.hybris_profile

  # android
  export STUDIO_JDK=/Library/Java/JavaVirtualMachines/jdk1.8.0_65.jdk
  export ANDROID_HOME=$HOME/Library/Android/sdk
  export PATH=$ANDROID_HOME:$PATH
  export PATH=$ANDROID_HOME/tools:$PATH
  export PATH=$ANDROID_HOME/platform-tools:$PATH
  alias runAndroidStudio="/Applications/Android\ Studio.app/Contents/MacOS/studio"
  
  # docker configuration
  export DOCKER_HOST=tcp://192.168.59.103:2376
  export DOCKER_CERT_PATH=$HOME/.boot2docker/certs/boot2docker-vm
  export DOCKER_TLS_VERIFY=1
  export DOCKER_API_VERSION=1.21

  # m-cli  Swiss Army Knife for Mac OS X (https://github.com/rgcr/m-cli)
  export PATH=/usr/local/m-cli:$PATH

  alias mc='mc -a -S modarin256-defbg' # midgnight commander colorized

  # go to the home directory in the beginning
  cd $HOME
fi

alias reloadTmuxConf="tmux source-file ~/.tmux.conf"
alias resetTomcat="ps -ef | grep tomcat | awk '{print $2}' | xargs kill -9"
alias showMyExtIp="curl http://ipecho.net/plain; echo"
alias prettyJson="python -m json.tool"
alias showWeather="curl -4 http://wttr.in/Gliwice"
alias connectToLinuxPl="ssh -l wittchen -p 59184 wittchen.linuxpl.info"
alias moo="cowsay"

function findFile() {
  find ~/ -type f -name "$1"
}

function findDir() {
  find ~/ -type d -name "$1"
}

function getAndPlay() {
  wget $@ && mplayer $(basename $@);
}

function showWeatherIn() {
  curl -4 http://wttr.in/"$1"
}

function showMyIntIps() {
  ifconfig | grep -B1 "inet addr" | awk '{ if ( $1 == "inet" ) { print $2 } else if ( $2 == "Link" ) { printf "%s:" ,$1 } }' | awk -F: '{ print $1 ": " $3 }'
}

function showMyIntIpFor() {
  /sbin/ifconfig $1 | grep "inet addr" | awk -F: '{print $2}' | awk '{print $1}';
}

function catColorized() {
  cat "$1" | colorize
}

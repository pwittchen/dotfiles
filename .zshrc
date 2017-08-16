# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"

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

# git setup aliases
alias setupGitUserName="git config --global user.name \"Piotr Wittchen\""
alias setupGitPersonal="git config --global user.email \"piotr@wittchen.biz.pl\""
alias setupGitForWork="git config --global user.email \"piotr.wittchen@sap.com\""

setupGitUserName

# setup for Ubuntu Linux used at home
if [ `uname` = "Linux" ]; then
  # right now, I'm using tmux only on Linux
  [[ $TERM != "screen" ]] && exec tmux

  # setting personal e-mail for git
  setupGitPersonal

  alias resetGnomePanel="sudo killall gnome-panel"
  alias resetNautilus="sudo killall nautilus && nautilus"
  alias pbcopy='xsel --clipboard --input'
  alias pbpaste='xsel --clipboard --output'

  # get Midnight Commander themes from:
  # https://github.com/MidnightCommander/mc/tree/master/misc/skins
  alias mc="mc -S nicedark"

  if [[ $(python -mplatform | grep Ubuntu) ]]; then
    alias get="sudo apt-get install"
    alias remove="sudo apt-get remove"
    alias autoremove="sudo apt-get remove --auto-remove"
    alias purge="sudo apt-get purge --auto-remove"
    alias update="sudo apt-get update"
    alias upgrade="sudo apt-get update && sudo apt-get updgrade"
  fi

  # system info
  alias countCpus='cat /proc/cpuinfo | grep "physical id" | sort -u | wc -l'
  alias countCores='cat /proc/cpuinfo | grep "siblings" | sort -u | cut -d: -f2'
  alias countTotalRam="grep MemTotal /proc/meminfo"
  alias countFreeRam="grep MemFree /proc/meminfo"
  alias countTotalSwap="grep SwapTotal /proc/meminfo"

  # network info
  # reference for script below: https://github.com/bwaldvogel/neighbourhood
  alias neighbourhood="sudo neighbourhood.py"

  # volume control
  alias volUp='pactl set-sink-volume 0 +3%'
  alias volDown='pactl set-sink-volume 0 -3%'

  # development directory
  export DEV=$HOME/Development

  # java
  export JAVA_HOME=/usr/lib/jvm/java-8-oracle
  export PATH=$JAVA_HOME/bin:$PATH
  alias switchJava="sudo update-alternatives --config java"
  alias showJavaVersions="ls -l /usr/lib/jvm"
  alias jshell='/usr/lib/jvm/java-9-oracle/bin/jshell'

  # android
  export ANDROID_HOME=$DEV/android/android-sdk
  export PATH=$PATH:$ANDROID_HOME/platform-tools
  export PATH=$PATH:$ANDROID_HOME/tools
  export PATH=$PATH:$ANDROID_HOME/tools/bin
  export PATH=$PATH:$ANDROID_HOME/emulator
  alias listAndroidEmulators="emulator -list-avds"
  alias runAndroidEmulator="cd $ANDROID_HOME/emulator && emulator -use-system-libs -avd $(emulator -list-avds | sed -n 1p)"
  # hint: we can access local machine from Android emulator at: 10.0.2.2

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

# setup for macOS used at work
if [ `uname` = "Darwin" ]; then

  # loading SAP Hybris Backoffice development configuration + office and corpo utils
  source $HOME/.hybris.conf
  
  # setting SAP Hybris (work) e-mail for git 
  setupGitForWork 

  # aliases for switching java version
  alias setJdk7='export JAVA_HOME=$(/usr/libexec/java_home -v 1.7)'
  alias setJdk8='export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)'
  alias setJdk9='export JAVA_HOME=$(/usr/libexec/java_home -v 1.9)'
  alias setJdk8SAP='export JAVA_HOME=/Library/Java/JavaVirtualMachines/sapjvm_8/'

  # show existing java versions (JDKs)
  alias showJavaVersions='ls -l /Library/Java/JavaVirtualMachines'

  # set current java version and JAVA_HOME
  export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
  export PATH=$JAVA_HOME/bin:$PATH

  # go to directory with JVMs
  alias goToJvmsDir='cd /Library/Java/JavaVirtualMachines'

  # showing and hiding hidden files
  function makeFilesVisible() {
    defaults write com.apple.finder AppleShowAllFiles $1 && sudo killall Finder
  }

  alias showHiddenFiles="makeFilesVisible YES"
  alias hideHiddenFiles="makeFilesVisible NO"
  alias restartMenuBar="killall -KILL SystemUIServer"

  # android
  export STUDIO_JDK=/Library/Java/JavaVirtualMachines/jdk1.8.0_65.jdk
  export ANDROID_HOME=$HOME/Library/Android/sdk
  export PATH=$ANDROID_HOME:$PATH
  export PATH=$ANDROID_HOME/tools:$PATH
  export PATH=$ANDROID_HOME/platform-tools:$PATH
  alias runAndroidStudio="/Applications/Android\ Studio.app/Contents/MacOS/studio"

  # go
  export GOPATH=$HOME/Projects/other/go/workspace

  # m-cli Swiss Army Knife for Mac OS X (https://github.com/rgcr/m-cli)
  export PATH=/usr/local/m-cli:$PATH

  alias mc='mc -a -S modarin256-defbg' # midgnight commander colorized

  # go to the home directory in the beginning
  cd $HOME
fi

# aliases, which work both on Linux and macOS

# js
alias npm="sudo npm"

# python
alias pip="sudo pip"

# android
alias adbWifiDown='adb shell svc wifi disable'
alias adbWifiUp='adb shell svc wifi enable'

# general aliases
alias reloadTmuxConf="tmux source-file ~/.tmux.conf"
alias reloadShell="source ~/.zshrc"
alias resetTomcat="ps -ef | grep tomcat | awk '{print $2}' | xargs kill -9"
alias showJavaProcesses="jps -lV"
alias showMyExtIp="curl http://ipecho.net/plain; echo"
alias prettyJson="python -m json.tool"
alias showWeather="showWeatherIn Gliwice"
alias connectToLinuxPl="ssh -l wittchen -p 59184 wittchen.linuxpl.info"
alias runPythonHttpSever="python -m SimpleHTTPServer 8000"
alias runPhpHttpServer="php -S localhost:8000 -t ./"
alias startMySqlServer="sudo /etc/init.d/mysql start"
alias stopMySqlServer="sudo /etc/init.d/mysql stop"
alias connectToMySqlServer="sudo mysql -u root -p"
alias startMongoDb="sudo service mongod start"
alias stopMongoDb="sudo service mongod stop"
alias moo="cowsay"
alias cowthink="cowsay"
alias trim="awk '{gsub(/^ +| +$/,\"\")}1'"
alias firstLine="head -n1"
alias lastLine="tail -n1"
alias excludeGrep="grep -v grep"
alias quickPing="ping 8.8.8.8 -c 1"
alias vi="vim"

# functions for Linux and macOS

function lcd() {
  cd "$1"; ls;
}

function cutLastChars() {
  numberOfCharsToCut=$1
  numberOfCharsToCut=$[numberOfCharsToCut+1];
  rev | cut -c $numberOfCharsToCut- | rev
}

# searches for a phrase in all files in the current directory recursively
function findPhrase() {
  grep -r "$1" .
}

function findFile() {
  find ~/ -type f -name "$1"
}

function findFileInCurrentDir() {
  find . -type f -ls | grep "$1"
}

function findDir() {
  find ~/ -type d -name "$1"
}

function findDirInCurrentDir() {
  find . -type d -ls | grep "$1"
}

function getAndPlay() {
  wget $@ && mplayer $(basename $@);
}

function showWeatherIn() {
  curl -s http://wttr.in/"$1" | head -n 7 && printf "\n"
}

function catColorized() {
  cat "$1" | colorize
}

# kill process with a given name
function killProcess() {
  ps -ef | grep $1 | awk '{print $2}' | head -n1 | xargs kill -9
}

# shows cpu and memory usage of a single process
function showProcessStats() {
  ps -p $1 -o %cpu,%mem,cmd
}

# display function output log in the console and save it into a given file
function tea() {
  tee -a $1
}

# allows to perform a given operation with constant refresh in an infinite loop
function repeatOperation() {
  watch -n 1 $1 
}


# this must be at the end of the file for sdkman to work!
export SDKMAN_DIR="/$HOME/.sdkman"
[[ -s "/$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "/$HOME/.sdkman/bin/sdkman-init.sh"

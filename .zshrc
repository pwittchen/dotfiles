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
plugins=(git colorize brew mvn gradle pip sudo zsh-autosuggestions)

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
alias setupGitPersonal="git config --global user.email \"piotr@wittchen.io\""
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

  # bluetooth
  alias restartBluetooth="hciconfig sspmode 1 && hciconfig hci0 down && hcicongig hci0 up"

  # volume control
  alias volUp='pactl set-sink-volume 0 +3%'
  alias volDown='pactl set-sink-volume 0 -3%'

  # development directory
  export DEV=$HOME/Development

  alias sjk="java -jar ~/Software/sjk/sjk-plus-0.9.3.jar" # see: https://github.com/aragozin/jvm-tools
  alias yed="java -jar ~/Software/yed-3.18.1.1/yed.jar"

  # android
  export ANDROID_HOME=$DEV/android/android-sdk
  export PATH=$PATH:$ANDROID_HOME/platform-tools
  export PATH=$PATH:$ANDROID_HOME/tools
  export PATH=$PATH:$ANDROID_HOME/tools/bin
  export PATH=$PATH:$ANDROID_HOME/emulator
  alias listAndroidEmulators="emulator -list-avds"
  alias runAndroidEmulator="cd $ANDROID_HOME/emulator && emulator -use-system-libs -avd $(emulator -list-avds | sed -n 1p)"
  # hint: we can access local machine from Android emulator at: 10.0.2.2

  # node.js and npm
  export NPM_CONFIG_PREFIX=~/.npm-global
  export PATH=~/.npm-global/bin:$PATH

  # go
  export PATH=/usr/local/go/bin:$PATH
  export GOPATH=$DEV/go/workspace
  export GOBIN=$GOPATH/bin
  export PATH=$GOBIN:$PATH

  # swift
  export PATH=$DEV/swift/swift/usr/bin:$PATH

  # smalltalk
  alias gnu-smalltalk="/usr/bin/gst"

  # dart
  export PATH=/usr/lib/dart/bin:$PATH

  # mysql
  alias startMySqlServer="sudo service mysql start"
  alias stopMySqlServer="sudo service mysql stop"

  # mongodb
  alias startMongoDb="sudo service mongod start"
  alias stopMongoDb="sudo service mongod stop"

  # marktext
  alias marktext="~/Software/marktext/marktext-0.9.25-x86_64.AppImage"

  # configuring linux brew
  export PATH='/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin':"$PATH"
fi

# setup for macOS used at work
if [ `uname` = "Darwin" ]; then

  # loading SAP Hybris Backoffice development configuration + office and corpo utils
  source $HOME/.hybris.conf
  
  # setting SAP Hybris (work) e-mail for git 
  setupGitForWork 

  # showing and hiding hidden files
  function makeFilesVisible() {
    defaults write com.apple.finder AppleShowAllFiles $1 && sudo killall Finder
  }

  # macOS system aliases
  alias showHiddenFiles="makeFilesVisible YES"
  alias hideHiddenFiles="makeFilesVisible NO"
  alias restartMenuBar="killall -KILL SystemUIServer"

  # android
  export STUDIO_JDK=/Library/Java/JavaVirtualMachines/jdk1.8.0_65.jdk
  export ANDROID_HOME=$HOME/Library/Android/sdk
  export PATH=$ANDROID_HOME:$PATH
  export PATH=$ANDROID_HOME/tools:$PATH
  export PATH=$ANDROID_HOME/platform-tools:$PATH

  # go
  export GOPATH=$HOME/Projects/other/go/workspace

  # flutter
  export PATH=$HOME/flutter/bin:$PATH

  # midnight commander colorized
  alias mc='mc -a -S modarin256-defbg'

  # mysql
  export PATH=/usr/local/mysql/bin/:$PATH
  alias startMySqlServer="sudo /usr/local/mysql/support-files/mysql.server start"
  alias stopMySqlServer="sudo /usr/local/mysql/support-files/mysql.server stop"
  alias restartMySqlServer="sudo /usr/local/mysql/support-files/mysql.server restart"

  # go to the home directory in the beginning
  cd $HOME
fi

# aliases, which work both on Linux and macOS

# python
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
# init pyenv
if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
fi

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
alias connectToMySqlServer="sudo mysql -u root"
alias moo="cowsay"
alias cowthink="cowsay"
alias trim="awk '{gsub(/^ +| +$/,\"\")}1'"
alias firstLine="head -n1"
alias lastLine="tail -n1"
alias excludeGrep="grep -v grep"
alias vi="vim"
alias countCpusWithPython="python -c 'import multiprocessing as mp; print(mp.cpu_count())'"
alias javaInfo="echo 'JAVA_HOME:' $JAVA_HOME && java -version"
alias lg="lazygit"
alias hex2bin="wcalc -d"
alias bin2hex="wcalc -h"

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

# kill all detached sessions of the screen
function killScreens() {
    screen -ls | grep Detached | cut -d. -f1 | awk '{print $1}' | xargs kill
}

function killScreen() {
    screen -X -S $1 quit
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

# removes docker container by name
function removeDockerContainer() {
  sudo docker rmi -f $(sudo docker images | grep $1 | awk '{print $3}')
}

function gitPullAll() {
  gitCmdAll $1 pull
}

function gitStatusAll() {
  gitCmdAll $1 status
}

# for all git repos in a given dir ($1), it runs a given command ($2)
function gitCmdAll() {
  current_dir=$(pwd)
  echo "going into $1"
  cd $1
  projects=($(ls -1 $1 | tr "\n" " " | rev | cut -c 1- | rev))
  for project in "${projects[@]}"
  do
      echo "executing git $2 for $project"
      cd $1/$project
      git $2 || true
      echo "--------------------------"
  done
  echo "going back to $current_dir"
  cd $current_dir
}

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=3"

# this must be at the end of the file for sdkman to work!
export SDKMAN_DIR="/$HOME/.sdkman"
[[ -s "/$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "/$HOME/.sdkman/bin/sdkman-init.sh"

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

alias setupGitUserName="git config --global user.name \"Piotr Wittchen\""
alias setupGitPersonal="git config --global user.email \"piotr@wittchen.io\""

setupGitUserName

if [ `uname` = "Linux" ]; then
  [[ $TERM != "screen" ]] && exec tmux

  if [ `hostname` = "t470s" ]; then
      setupGitPersonal
  fi

  # linux aliases
  alias pbcopy='xsel --clipboard --input'
  alias pbpaste='xsel --clipboard --output'
  alias mc="mc -S nicedark"
  alias tsm="transmission-remote"
  alias clearGnomeDesktopBgs="sudo rm -rf $HOME/.cache/gnome-control-center/backgrounds/*"

  # linux paths
  export DEV=$HOME/Development
  export PATH=$PATH:$HOME/.scripts
  export PATH='/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin':"$PATH"

  # android
  export ANDROID_HOME=$HOME/Android/Sdk
  export PATH=$PATH:$ANDROID_HOME/tools/bin
  export PATH=$PATH:$ANDROID_HOME/emulator
  alias listAndroidEmulators="emulator -list-avds"
  alias runAndroidEmulator="cd $ANDROID_HOME/emulator && emulator -use-system-libs -avd $(emulator -list-avds | sed -n 1p)"
  # hint: we can access local machine from Android emulator at: 10.0.2.2
fi

if [ `uname` = "Darwin" ]; then

  # macOS functions

  function makeFilesVisible() {
    defaults write com.apple.finder AppleShowAllFiles $1 && sudo killall Finder
  }

  # macOS aliases
  alias showHiddenFiles="makeFilesVisible YES"
  alias hideHiddenFiles="makeFilesVisible NO"
  alias restartMenuBar="killall -KILL SystemUIServer"
  alias mc='mc -a -S modarin256-defbg'

  cd $HOME
fi

# python
export PATH=$HOME/.local/lib/python3.6/site-packages/:$PATH

# general aliases
alias reloadTmuxConf="tmux source-file ~/.tmux.conf"
alias reloadShell="source ~/.zshrc"
alias showJavaProcesses="jps -lV"
alias showMyExtIp="curl http://ipecho.net/plain; echo"
alias prettyJson="python -m json.tool"
alias showWeather="showWeatherIn Gliwice"
alias connectToLinuxPl="ssh -l wittchen -p 59184 wittchen.linuxpl.info"
alias runPythonHttpSever="python3 -m http.server 8000"
alias trim="awk '{gsub(/^ +| +$/,\"\")}1'"
alias firstLine="head -n1"
alias lastLine="tail -n1"
alias excludeGrep="grep -v grep"
alias hex2bin="wcalc -d"
alias bin2hex="wcalc -h"

# general functions

function lcd() {
  cd "$1"; ls;
}

function cutLastChars() {
  numberOfCharsToCut=$1
  numberOfCharsToCut=$[numberOfCharsToCut+1];
  rev | cut -c $numberOfCharsToCut- | rev
}

function findPhraseInCurrentDir() {
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

function killProcessByName() {
  ps -ef | grep $1 | awk '{print $2}' | head -n1 | xargs kill -9
}

function killAllDetachedScreenSessions() {
    screen -ls | grep Detached | cut -d. -f1 | awk '{print $1}' | xargs kill
}

function killScreen() {
    screen -X -S $1 quit
}

function showProcessStats() {
  ps -p $1 -o %cpu,%mem,cmd
}

function tea() {
  tee -a $1
}

function repeatOperation() {
  watch -n 1 $1 
}

function removeDockerContainerByName() {
  sudo docker rmi -f $(sudo docker images | grep $1 | awk '{print $3}')
}

function gitPullAll() {
  gitCmdAll $1 pull
}

function gitStatusAll() {
  gitCmdAll $1 status
}

function gitCmdAll() {
  current_dir=$(pwd)
  echo "going into $1 directory"
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

export ZSH=$HOME/.oh-my-zsh
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=3"

ZSH_THEME="agnoster"
plugins=(git colorize brew mvn gradle pip sudo zsh-autosuggestions)
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
source $ZSH/oh-my-zsh.sh

source ~/.scripts/functions/personal.sh
setupGitUserName

if [ `uname` = "Linux" ]; then
  [[ $TERM != "screen" ]] && exec tmux

  if [ `hostname` = $PERSONAL_MACHINE ]; then
      setupGitPersonalEmail
  fi

  export DEV=$HOME/Development
  export PATH=$PATH:$HOME/.scripts
  export PATH='/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin':"$PATH"

  source ~/.scripts/functions/linux.sh
  source ~/.scripts/functions/android.sh
fi

if [ `uname` = "Darwin" ]; then
  source ~/.scripts/functions/apple.sh
  cd $HOME
fi

source ~/.scripts/functions/general.sh
source ~/.scripts/functions/web.sh
source ~/.scripts/functions/git.sh
source ~/.scripts/functions/docker.sh
source ~/.scripts/functions/java.sh
source ~/.scripts/functions/python.sh
source ~/.scripts/functions/rust.sh
source ~/.scripts/functions/recordings.sh

export SDKMAN_DIR="/$HOME/.sdkman"
[[ -s "/$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "/$HOME/.sdkman/bin/sdkman-init.sh"

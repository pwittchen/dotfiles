export ZSH=$HOME/.oh-my-zsh
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=3"
ZSH_THEME="kolo"
plugins=(git colorize brew mvn gradle pip sudo zsh-autosuggestions zsh-syntax-highlighting)
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
source $ZSH/oh-my-zsh.sh

export PATH=$PATH:$HOME/.scripts

if [ `uname` = "Linux" ]; then
  [[ $TERM != "screen" ]] && exec tmux
  export PATH='/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin':"$PATH"
  alias mc="mc -S nicedark"
  alias tsm="transmission-remote"
fi

if [ `uname` = "Darwin" ]; then
  alias mc="mc -a -S modarin256-defbg"
fi

source ~/.scripts/functions/recording.sh

export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/emulator

export SDKMAN_DIR="/$HOME/.sdkman"
[[ -s "/$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "/$HOME/.sdkman/bin/sdkman-init.sh"

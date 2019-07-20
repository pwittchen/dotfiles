export ZSH=$HOME/.oh-my-zsh
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=3"
ZSH_THEME="bureau"
plugins=(git colorize brew mvn gradle pip sudo zsh-autosuggestions zsh-syntax-highlighting)
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
source $ZSH/oh-my-zsh.sh
export PATH=$PATH:$HOME/.scripts
export EDITOR=/usr/bin/vim
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/emulator

if [ `uname` = "Linux" ]; then
  [[ $TERM != "screen" ]] && exec tmux
fi

export SDKMAN_DIR="/$HOME/.sdkman"
[[ -s "/$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "/$HOME/.sdkman/bin/sdkman-init.sh"

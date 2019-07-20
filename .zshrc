export ZSH=$HOME/.oh-my-zsh
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=3"
ZSH_THEME="bureau"
plugins=(git colorize brew mvn gradle pip sudo zsh-autosuggestions zsh-syntax-highlighting)
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
source $ZSH/oh-my-zsh.sh
export PATH=$PATH:$HOME/.scripts
export VISUAL=vim
export EDITOR=/usr/bin/vim

if [ `uname` = "Linux" ]; then
  [[ $TERM != "screen" ]] && exec tmux
  alias mc="mc -S nicedark"
  alias trim="awk '{gsub(/^ +| +$/,\"\")}1'"
fi

if [ `uname` = "Darwin" ]; then
  alias mc="mc -a -S modarin256-defbg"
fi

export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/emulator

export SDKMAN_DIR="/$HOME/.sdkman"
[[ -s "/$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "/$HOME/.sdkman/bin/sdkman-init.sh"

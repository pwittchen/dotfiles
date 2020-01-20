export ZSH=$HOME/.oh-my-zsh
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=3"
ZSH_THEME="bureau"
plugins=(git colorize brew mvn gradle pip sudo zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh
source $HOME/.scripts/aliases.sh
export EDITOR=/usr/bin/vim
export GOPATH=$HOME/go
export ANDROID=$HOME/Android/Sdk
export PUBSUB_EMULATOR_HOST=localhost:8538
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
export PATH=$PATH:$HOME/.scripts:$GOPATH/bin:$ANDROID/tools/bin:$ANDROID/platform-tools:$ANDROID/emulator

if [ `uname` = "Linux" ]; then
  [[ $TERM != "screen" ]] && exec tmux
fi

if [ -f '/usr/local/bin/google-cloud-sdk/path.zsh.inc' ]; then
  . '/usr/local/bin/google-cloud-sdk/path.zsh.inc';
fi

if [ -f '/usr/local/bin/google-cloud-sdk/completion.zsh.inc' ]; then
  . '/usr/local/bin/google-cloud-sdk/completion.zsh.inc';
fi

export SDKMAN_DIR="/$HOME/.sdkman"
[[ -s "/$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "/$HOME/.sdkman/bin/sdkman-init.sh"

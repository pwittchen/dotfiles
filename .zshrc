export ZSH=$HOME/.oh-my-zsh
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=3"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git colorize brew mvn gradle pip sudo zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh
export EDITOR=/usr/bin/vim
export GOPATH=$HOME/go
export ANDROID=$HOME/Android/Sdk
export SDKMAN_DIR="/$HOME/.sdkman"
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
export PATH=$PATH:$HOME/.scripts:$GOPATH/bin:$ANDROID/tools/bin:$ANDROID/platform-tools:$ANDROID/emulator
[[ $TERM != "screen" ]] && exec tmux
. $HOME/.scripts/aliases.sh
. $HOME/.sdkman/bin/sdkman-init.sh
. $HOME/.p10k.zsh

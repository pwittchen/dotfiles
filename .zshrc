export ZSH=$HOME/.oh-my-zsh
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=3"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git colorize brew mvn gradle pip sudo zsh-autosuggestions zsh-syntax-highlighting)
. $ZSH/oh-my-zsh.sh
export EDITOR=/usr/bin/vim
export GOPATH=$HOME/go
export GOBIN=$HOME/go/bin
export ANDROID=$HOME/Android/Sdk
export SDKMAN_DIR="/$HOME/.sdkman"
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
export PATH=$PATH:$HOME/.scripts:$GOBIN:$ANDROID/tools/bin:$ANDROID/platform-tools:$ANDROID/emulator
[[ $TERM != "screen" ]] && exec tmux
. $HOME/.scripts/aliases.sh
. $HOME/.sdkman/bin/sdkman-init.sh
. $HOME/.p10k.zsh
. $HOME/google-cloud-sdk/path.zsh.inc
. $HOME/google-cloud-sdk/completion.zsh.inc

export ZSH=$HOME/.oh-my-zsh
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=3"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git colorize brew mvn gradle pip sudo zsh-autosuggestions zsh-syntax-highlighting kubectl)
. $ZSH/oh-my-zsh.sh
export EDITOR=/usr/bin/vim
export GOPATH=$HOME/development/prv/go/sdk
export GOBIN=$HOME/development/prv/go/sdk/bin
export ANDROID=$HOME/development/prv/android/sdk
export SDKMAN_DIR=$HOME/.sdkman
export WORKON_HOME=$HOME/.virtualenvs
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
export PATH=$PATH:$HOME/.scripts
export PATH=$PATH:$GOBIN
export PATH=$PATH:$ANDROID/tools/bin:$ANDROID/platform-tools:$ANDROID/emulator
[[ $TERM != "screen" ]] && exec tmux
. $HOME/.scripts/aliases.sh
. $HOME/.p10k.zsh
. $HOME/.sdkman/bin/sdkman-init.sh
. /usr/bin/virtualenvwrapper.sh
eval `ssh-agent` &> /dev/null && ssh-add -k ~/.ssh/id_rsa_df &> /dev/null

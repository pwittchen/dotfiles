export ZSH=$HOME/.oh-my-zsh
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=3"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git colorize brew mvn gradle pip sudo zsh-autosuggestions zsh-syntax-highlighting)
. $ZSH/oh-my-zsh.sh
export EDITOR=/usr/bin/vim
export GOPATH=$HOME/development/prv/go/sdk
export GOBIN=$HOME/development/prv/go/sdk/bin
export ANDROID=$HOME/development/prv/android/sdk
export SDKMAN_DIR="/$HOME/.sdkman"
export WORKON_HOME=~/.virtualenvs
export PYENV_ROOT="$HOME/.pyenv"
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
export PATH=$PATH:$HOME/.scripts:$GOBIN:$ANDROID/tools/bin:$ANDROID/platform-tools:$ANDROID/emulator:$PYENV_ROOT/bin
[[ $TERM != "screen" ]] && exec tmux
. $HOME/.scripts/aliases.sh
. $HOME/.sdkman/bin/sdkman-init.sh
. $HOME/.p10k.zsh
. $HOME/development/prv/infra/tools/google-cloud-sdk/path.zsh.inc
. $HOME/development/prv/infra/tools/google-cloud-sdk/completion.zsh.inc
. /usr/bin/virtualenvwrapper.sh
eval "$(pyenv init -)"

# main zsh config (maocs)

export ZSH=$HOME/.oh-my-zsh
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=244"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git colorize brew mvn gradle pip poetry sudo zsh-autosuggestions zsh-syntax-highlighting kubectl)

. $ZSH/oh-my-zsh.sh

# env variables
export DEV=$HOME/Development
export HOMEBREW=/opt/homebrew/bin
export GOPATH=$HOME/go/workspace
export ANDROID=$HOME/Library/Android/sdk
export ANDROID_HOME=$ANDROID
export VIRTUALENVWRAPPER_PYTHON=$HOMEBREW/python3.10
export VIRTUALENVWRAPPER_VIRTUALENV=$HOMEBREW/virtualenv
export EDITOR=/usr/bin/vim
export SDKMAN_DIR=$HOME/.sdkman
export WORKON_HOME=$HOME/.virtualenvs
export NVM_DIR="$HOME/.nvm"
export BUN_INSTALL="$HOME/.bun"
export DISABLE_TELEMETRY=1
export DISABLE_ERROR_REPORTING=1

# path configs
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$ANDROID/tools/bin:$ANDROID/platform-tools:$ANDROID/emulator
export PATH="$PATH:/Users/pw/.lmstudio/bin"
export PATH="$PATH:/Users/pw/.local/bin"
export PATH="$BUN_INSTALL/bin:$PATH"

# aliases
. $HOME/.aliases.sh

# tools
. $HOME/.p10k.zsh
. $HOME/.sdkman/bin/sdkman-init.sh
. $HOME/.cargo/env
. $HOMEBREW/virtualenvwrapper.sh

# homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# docker
fpath=(/Users/pw/.docker/completions $fpath) && autoload -Uz compinit && compinit

# nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" && [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# bun
[ -s "/Users/pw/.bun/_bun" ] && source "/Users/pw/.bun/_bun"

# opencode
export PATH=/Users/pw/.opencode/bin:$PATH

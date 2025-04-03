# main zsh config

export ZSH=$HOME/.oh-my-zsh
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=3"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git colorize brew mvn gradle pip poetry sudo zsh-autosuggestions zsh-syntax-highlighting kubectl)

. $ZSH/oh-my-zsh.sh

# env variables

export DEV=$HOME/Development
export HOMEBREW=/opt/homebrew/bin
export GOPATH=$DEV/prv/go/workspace
export ANDROID=$HOME/Library/Android/sdk
export ANDROID_HOME=$ANDROID
export VIRTUALENVWRAPPER_PYTHON=$HOMEBREW/python3.10
export VIRTUALENVWRAPPER_VIRTUALENV=$HOMEBREW/virtualenv
export EDITOR=/usr/bin/vim
export SDKMAN_DIR=$HOME/.sdkman
export WORKON_HOME=$HOME/.virtualenvs

# path config

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$ANDROID/tools/bin:$ANDROID/platform-tools:$ANDROID/emulator
export PATH="$PATH:/Users/pw/.lmstudio/bin"
export PATH="$PATH:/Users/pw/.local/bin"

# custom aliases

. $HOME/.aliases.sh

# tools config

. $HOME/.p10k.zsh
. $HOME/.sdkman/bin/sdkman-init.sh
. $HOME/.cargo/env
. $HOMEBREW/virtualenvwrapper.sh

# homebrew config

eval "$(/opt/homebrew/bin/brew shellenv)"

# nvm config

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# docker cli completions

fpath=(/Users/pw/.docker/completions $fpath)
autoload -Uz compinit
compinit


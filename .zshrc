export ZSH=$HOME/.oh-my-zsh
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=3"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git colorize brew mvn gradle pip sudo zsh-autosuggestions zsh-syntax-highlighting kubectl)
. $ZSH/oh-my-zsh.sh

if [ `uname` = "Darwin" ]; then
  export DEV=$HOME/Development
  export HOMEBREW=/opt/homebrew/bin
  export GOPATH=$DEV/prv/go/workspace
  export ANDROID=$HOME/Library/Android/sdk
  export VIRTUALENVWRAPPER_PYTHON=$HOMEBREW/python3
  export VIRTUALENVWRAPPER_VIRTUALENV=$HOMEBREW/virtualenv
else
  export DEV=$HOME/development
  export GOPATH=$DEV/prv/go/sdk
  export ANDROID=$DEV/prv/android/sdk
fi

export EDITOR=/usr/bin/vim
export SDKMAN_DIR=$HOME/.sdkman
export WORKON_HOME=$HOME/.virtualenvs

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
export PATH=$PATH:$HOME/.scripts
export PATH=$PATH:$HOME/.krew/bin
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$ANDROID/tools/bin:$ANDROID/platform-tools:$ANDROID/emulator
export PATH=$PATH:$HOME/.poetry/bin

. $HOME/.scripts/aliases.sh
. $HOME/.p10k.zsh
. $HOME/.sdkman/bin/sdkman-init.sh

if [ `uname` = "Darwin" ]; then
  . $HOMEBREW/virtualenvwrapper.sh
  eval "$(ssh-agent -s)" &> /dev/null
  eval "$(/opt/homebrew/bin/brew shellenv)"
else
  . /usr/bin/virtualenvwrapper.sh
  eval "$(ssh-agent -s)" &> /dev/null && ssh-add -k ~/.ssh/id_rsa_df &> /dev/null
  [[ $TERM != "screen" ]] && exec tmux
fi

export ZSH=$HOME/.oh-my-zsh
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=3"
ZSH_THEME="kolo"
plugins=(git colorize brew mvn gradle pip sudo zsh-autosuggestions zsh-syntax-highlighting)
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
source $ZSH/oh-my-zsh.sh

if [ `uname` = "Linux" ]; then
  [[ $TERM != "screen" ]] && exec tmux
  export PATH=$PATH:$HOME/.scripts
  source ~/.scripts/functions/linux.sh
  source ~/.scripts/functions/android.sh
fi

if [ `uname` = "Darwin" ]; then
  source ~/.scripts/functions/apple.sh
  cd $HOME
fi

source ~/.scripts/functions/general.sh
source ~/.scripts/functions/web.sh
source ~/.scripts/functions/docker.sh
source ~/.scripts/functions/python.sh
source ~/.scripts/functions/rust.sh
source ~/.scripts/functions/recording.sh
source ~/.scripts/functions/sdkman.sh

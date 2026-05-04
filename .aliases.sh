#!/usr/bin/env bash

alias dvp="cd ~/development"
alias dox="cd ~/documents"
alias dld="cd ~/downloads"
alias pix="cd ~/pictures"
alias mvs="cd ~/movies"
alias dtf="cd ~/development/prv/dotfiles"
alias sbx="cd ~/development/prv/sandbox"
alias wlp="cd ~/pictures/wallpapers"
alias pai="cd ~/documents/personal-ai"
alias sshcf="ssh wittchen@s143.cyber-folks.pl -p 222"

togglehidden() {
  current=$(defaults read com.apple.finder AppleShowAllFiles 2>/dev/null)
  if [ "$current" = "1" ] || [ "$current" = "true" ]; then
    defaults write com.apple.finder AppleShowAllFiles false
    echo "Hidden files: OFF"
  else
    defaults write com.apple.finder AppleShowAllFiles true
    echo "Hidden files: ON"
  fi
  killall Finder
}

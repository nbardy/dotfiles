#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

# Alias for movement
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'

# chromium shortcuts
alias ch='nohup chromium &'
alias ci='nohup chromium --incognito &'
alias ck='killall chromium;killall chromium-sandbox; nohup chromium --disable-web-security &'

# Add color to grep
alias grep='grep --color=auto'

# Allow mkdir to spawn parent directories
alias mkdir='mkdir -pv'

# Alias NeoVim
alias vim='nvim'
# Vim mispellings
alias vi='vim'
alias vmi='vim'
alias im='vim'

# pacman 
alias pi='sudo pacman -S'
alias shutdown='sudo shutdown -h 0'

# git shortcuts
alias gca='git commit -a'
alias gcm='git commit -m'
alias gs='git status'
alias gb='git branch'
# git new gbranch
alias gnb='git checkout -b'

alias gpo='git push origin master'
alias gph='git push heroku master'
alias gap='git add -p'



PS1='[\u@\h \W]\$ '
EDITOR=vim

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

PATH=$PATH:~/bin
PATH=$PATH:/opt/minizinc-1.6/bin

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Simple static file server
alias ss='python3 -m http.server 8000'

alias lf='lein figwheel'


# Add git branch to prompt
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "


# Disable ctrl-s for XOFF(listens to keystrokes and does nothing)
stty ixany
stty ixoff -ixon

alias lr='lein repl'

GENYMOTION_APP="/usr/bin/genymotion"
GENYMOTION_SHELL="/usr/bin/genymotion-shell"
ANDROID_HOME="/home/nicholas/Android/Sdk"

export NVM_DIR="/home/nicholas/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

function sc() {
  if [[ $1 == "" ]]; then
    cat ~/Dropbox/SCHEDULE
  else
    vim ~/Dropbox/SCHEDULE
  fi
}

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

alias gpo='git push origin master'
alias gph='git push heroku master'

PS1='[\u@\h \W]\$ '
EDITOR=vim

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

PATH=$PATH:~/bin

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Simple static file server
alias ss='python3 -m http.server 8000'


# Add grunt completion
source ~/.grunt.bash

# Disable ctrl-s for XOFF(listens to keystrokes and does nothing)
stty ixany
stty ixoff -ixon

# {{{
# Node Completion - Auto-generated, do not touch.
shopt -s progcomp
for f in $(command ls ~/.node-completion); do
  f="$HOME/.node-completion/$f"
  test -f "$f" && . "$f"
done
# }}}

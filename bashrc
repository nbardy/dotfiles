#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

# chromium shortcuts
alias ch='nohup chromium &'
alias ci='nohup chromium --incognito &'
alias ck='killall chromium;killall chromium-sandbox; nohup chromium --disable-web-security &'

# Vim mispellings
alias vi='vim'
alias vmi='vim'
alias im='vim'

# pacman 
alias pi='sudo pacman -S'
alias shutdown='sudo shutdown -h 0'

# git shortcuts
alias ga='git commit -am'
alias gm='git commit -m'
alias gs='git status'

alias hu='git push heroku master'

PS1='[\u@\h \W]\$ '
EDITOR=vim

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Simple static file server
alias ss='python3 -m http.server 8000'


# Add grunt completion
source ~/.grunt.bash

# Disable ctrl-s for XOFF(listens to keystrokes and does nothing)
stty ixany
stty ixoff -ixon

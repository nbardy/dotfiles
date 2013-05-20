#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ch='nohup chromium &'
alias ci='nohup chromium --incognito &'
alias ck='killall chromium;killall chromium-sandbox; nohup chromium --disable-web-security &'
alias vi='vim'
alias vmi='vim'
alias im='vim'
alias pi='sudo pacman -S'
alias restart='sudo shutdown -h 0'

alias ga='git commit -am'
alias gm='git commit -m'
alias gs='git status'

alias hu='git push heroku master'

PS1='[\u@\h \W]\$ '

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

alias ss='python3 -m http.server 8000'
alias shutdown='sudo shutdown -h 0'
alias tit='titanium build --platform mobileweb'

# Add sencha to path
export PATH=/home/nicholas/bin/Sencha/Cmd/3.0.2.288:$PATH
export SENCHA_CMD_3_0_0="/home/nicholas/bin/Sencha/Cmd/3.0.2.288"

# Add grunt completion
source ~/.grunt.bash

# Disable ctrl-s for XOFF(listens to keystrokes and does nothing)
stty ixany
stty ixoff -ixon

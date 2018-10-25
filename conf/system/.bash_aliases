# Uage: curl https://raw.githubusercontent.com/wxnacy/wshell/master/bin/conf/bash_aliases -o ~/.bash_aliases
# for git
alias gst="git status"

# for system
alias ll="ls -l"
alias la="ls -la"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
if [ -f ~/.bash_profile ];then
    alias bps="source ~/.bash_profile"
    alias bpc="vim ~/.bash_profile"
fi
if [ -f ~/.profile ];then
    alias bps="source ~/.profile"
    alias bpc="vim ~/.profile"
fi
alias bs="source ~/.bashrc"
alias bc="vim ~/.bashrc"
alias bas="source ~/.bash_aliases"
alias bac="vim ~/.bash_aliases"
alias sshc="vim ~/.ssh/config"
alias vimc="vim ~/.vimrc"
alias c="clear"
alias h="history"

# for docker
alias docker="sudo docker"

# for vagrant
alias vg="vagrant"
alias vgreup="vagrant destroy -f && vagrant up"
alias vgd="vagrant destroy -f"

export WSHELL="${HOME}/.wshell"

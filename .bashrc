#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

# My Aliases
alias mv='mv -i'
alias cp='cp -i'
alias rm='rm -i'
alias sudopacsyu='sudo pacman -Syu'

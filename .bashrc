#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Prompt
PS1="[\u@\h \W]\$ "

alias ls="ls --color=auto"
alias l="ls"
alias la="ls -A"
alias lsa="la"
alias grep="grep --color=auto"
alias mv="mv -i"
alias rm="rm -I"
alias cp="cp -i"
alias supacsyu="sudo pacman -Syu"

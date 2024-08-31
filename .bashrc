#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

nc='\033[0m'
blue='\033[0;34m'
green='\033[0;32m'

# Prompt
PS1="${green}[bash]${nc} ${blue}\w${nc}
${green}\$${nc} "

unset nc blue green

~/.Scripts/reminder.sh

complete -F _command doas

alias ls="ls --color=auto"
alias l="ls"
alias la="ls -A"
alias lsa="la"
alias grep="grep --color=auto"
alias mv="mv -i"
alias rm="rm -I"
alias cp="cp -i"
alias supacsyu="sudo pacman -Syu"

source /usr/share/nvm/init-nvm.sh

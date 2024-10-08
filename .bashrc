# If not running interactively, don't do anything
[[ $- != *i* ]] && return

nc='\033[0m'
red='\033[0;31m'
green='\033[0;32m'
blue='\033[0;34m'

if [[ "$(whoami)" == 'root' ]] then
    PS1="${red}[ROOT/bash]${nc} ${blue}\w${nc}
${red}\$${nc} "
    echo -e "${red}Running as root.${nc}"
    alias ls='ls --color=auto'
    alias l='ls'
    alias la='ls -A'
    alias lsa='la'
    alias grep='grep --color=auto'
    alias mv='mv -i'
    alias rm='rm -I'
    alias cp='cp -i'
else
    PS1="${green}[bash]${nc} ${blue}\w${nc}
${green}\$${nc} "

    ~/.Scripts/reminder.sh
    source ~/.Scripts/aliases.sh
fi

unset nc red green blue

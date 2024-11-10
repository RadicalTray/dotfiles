bind 'set show-mode-in-prompt on'
nc='\033[0m'
red='\033[0;31m'
green='\033[0;32m'
blue='\033[0;34m'

PS1="${green}[bash]${nc} ${blue}\w${nc}
\$ "

unset nc red green blue

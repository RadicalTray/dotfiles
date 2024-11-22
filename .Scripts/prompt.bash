nc='\033[0m'
red='\033[0;31m'
green='\033[0;32m'
blue='\033[0;34m'

PS1='($?)'
PS1+="${green}[bash]\u@\H${nc} ${blue}\w${nc}
\$ "

unset nc red green blue

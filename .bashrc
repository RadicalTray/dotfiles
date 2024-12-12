source ~/.Scripts/env.sh

[[ $- != *i* ]] && return

# Haven't really found a difference in 'bash -c' when put in here
#
# $LS_COLORS is probably unset somewhere between tty shell and terminal gui shell
# couldn't find $LS_COLORS when put in ~/.Scripts/env.sh that is sourced in ~/.profile
# which is sourced by ~/.bash_profile
eval $(dircolors "$HOME/.Scripts/dircolors")

~/.Scripts/reminder.sh

source ~/.Scripts/prompt.bash

source ~/.Scripts/aliases.sh
source ~/.Scripts/functions.sh
source ~/.Scripts/plugins.sh
eval "$(zoxide init bash)"
[ -f ~/.Scripts/local.sh ] && source ~/.Scripts/local.sh

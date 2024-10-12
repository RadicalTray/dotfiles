source ~/.Scripts/env.sh
# no 'typeset -U' in bash D:

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

~/.Scripts/reminder.sh

set -o vi

source ~/.Scripts/prompt.bash

source ~/.Scripts/aliases.sh
source ~/.Scripts/functions.sh
source ~/.Scripts/plugins.sh
eval "$(zoxide init bash)"
source ~/.Scripts/local.sh

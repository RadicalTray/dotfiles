source ~/.Scripts/env.sh

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

~/.Scripts/reminder.sh

bind 'set editing-mode vi' # or set -o vi
bind 'set colored-stats on'

source ~/.Scripts/prompt.bash

source ~/.Scripts/aliases.sh
source ~/.Scripts/functions.sh
source ~/.Scripts/plugins.sh
eval "$(zoxide init bash)"
source ~/.Scripts/local.sh

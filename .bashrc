eval $(dircolors "$HOME/.Scripts/dircolors")

[[ $- != *i* ]] && return

~/.Scripts/reminder.sh

source ~/.Scripts/prompt.bash

source ~/.Scripts/aliases.sh
source ~/.Scripts/functions.sh
source ~/.Scripts/plugins.sh
eval "$(zoxide init bash)"
source ~/.Scripts/local.sh

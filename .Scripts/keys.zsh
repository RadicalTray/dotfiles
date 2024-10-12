bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word

bindkey -v

autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd '^E' edit-command-line

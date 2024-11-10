setopt prompt_subst

# autoload -Uz vcs_info
# zstyle ':vcs_info:*' check-for-changes true # enable both %u and %c
# # zstyle ':vcs_info:*' check-for-staged-changes true # enable only %c (faster)
# zstyle ':vcs_info:*' get-revision true
# zstyle ':vcs_info:*' unstagedstr ' %F{yellow}*%f'
# zstyle ':vcs_info:*' stagedstr ' %F{green}+%f'
# zstyle ':vcs_info:git:*' formats ' %F{magenta}[%s]%f %F{red}(%b)%f%u%c'
# zstyle ':vcs_info:git:*' actionformats ' %F{magenta}[%s]%f %F{red}(%b)%f %F{cyan}<%a>%f%u%c'
# precmd_functions+=(vcs_info)

zle -N zle-line-init
zle -N zle-keymap-select
function zle-line-init zle-keymap-select {
    case $KEYMAP in
        main)   zsh_current_mode_="(ins)" ;;
        vicmd)  zsh_current_mode_="(cmd)" ;;
        *)      zsh_current_mode_="($KEYMAP)" ;; # probably not possible
    esac
    zle reset-prompt
}

function check_last_exit_code() {
  local LAST_EXIT_CODE=$?
  if [[ $LAST_EXIT_CODE -ne 0 ]]; then
    RPROMPT="%F{red}<$LAST_EXIT_CODE>%f"
  else
    RPROMPT="%F{green}<$LAST_EXIT_CODE>%f"
  fi
}
precmd_functions+=(check_last_exit_code)

PROMPT='%F{green}[zsh]%f %F{blue}%~%f${vcs_info_msg_0_}
${zsh_current_mode_}%# '

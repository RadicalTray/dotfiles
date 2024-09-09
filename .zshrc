# zmodload zsh/zprof
# NOTE: REMINDER :D

~/.Scripts/reminder.sh

# -----------------

# History config
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# The following lines were added by compinstall
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

###########
### Env ###
###########

# put python venv in here, and if you want the python venv prompt thingy source env.sh after setting prompt
source ~/.Scripts/env.sh

#####################
### CUSTOM PROMPT ###
#####################

# allows parameter expansion, arithmatic, and shell substitution in prompts
setopt prompt_subst

autoload -Uz vcs_info

# this makes it slow, there is an optimization for it but it has a problem
# and i probably won't have that large of a repo
zstyle ':vcs_info:*' check-for-changes true

# Alternatively, the following would set only %c, but is faster:
#zstyle ':vcs_info:*' check-for-changes false
#zstyle ':vcs_info:*' check-for-staged-changes true

zstyle ':vcs_info:*' get-revision true
zstyle ':vcs_info:*' unstagedstr ' %F{yellow}*%f'
zstyle ':vcs_info:*' stagedstr ' %F{green}+%f'
zstyle ':vcs_info:git:*' formats ' %F{magenta}[%s]%f %F{red}(%b)%f%u%c'
zstyle ':vcs_info:git:*' actionformats ' %F{magenta}[%s]%f %F{red}(%b)%f %F{cyan}<%a>%f%u%c'
precmd_functions+=(vcs_info) # does not have to be after zstyle btw

function check_last_exit_code() {
  local LAST_EXIT_CODE=$?
  if [[ $LAST_EXIT_CODE -ne 0 ]]; then
    RPROMPT="%F{red}<$LAST_EXIT_CODE>%f"
  else
    RPROMPT="%F{green}<$LAST_EXIT_CODE>%f"
  fi
}
precmd_functions+=(check_last_exit_code)

# This works but i don't think it looks clean,
# and also because if check_last_exit_code is placed after vcs_info then
# it use vcs_info's exit code (which is probably always 0)
#
# precmd() {
#   check_last_exit_code;
#   vcs_info;
# }

PROMPT='%F{green}[zsh]%f %F{blue}%~%f${vcs_info_msg_0_}
%F{green}%%%f '

################
### Keybinds ###
################

bindkey -e
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word

###############
### Aliases ###
###############

# System
alias mvy="mv"
alias rmy="rm"
alias cpy="cp"
alias mv="mv -i"
alias rm="rm -I"
alias cp="cp -i"
alias supacsyu="sudo pacman -Syu"
alias parusyu="paru -Syu --needed"
alias yaysyu="yay -Syu --needed"

# Convenience
alias sa="source ~/.zshrc;echo 'Config sourced.'"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias cl="clear"
alias ls="eza --color=auto --icons=auto --sort=type"
alias l="ls"
alias la="ls -A"
alias ll="ls -lg"
alias lla="ll -A"
alias llt="ll -T"
alias llta="llt -A"
alias lt="ls -T"
alias lta="lt -A"
alias ltg="lt --git-ignore"
alias ltga="ltg -A"
alias grep="grep --color=auto"
alias cat="bat --plain --color=auto"

# Config
alias dotfiles='/usr/bin/git --git-dir="$HOME/.Dotfiles/" --work-tree="$HOME"'
alias nvim-config="cd ~/.config/nvim;nvim"
alias wezterm-config="cd ~/.config/wezterm;nvim"

###########
### Git ###
###########
alias gs="git status"

alias ga="git add"
alias gaa="git add --all"
alias gaac="git add --all;git commit"
alias gaacm="git add --all;git commit -m"

alias gc="git commit"
alias gcm="git commit -m"
alias gca="git commit --all"
alias gcam="git commit --all -m"

alias gd="git diff"
alias gds="git diff --staged"

alias gf="git fetch"
alias gfl="gf;git log HEAD..FETCH_HEAD"
alias gflo="gfl --oneline"
alias gflog="gflo --graph"
alias gfd="gf;git diff HEAD..FETCH_HEAD"

# LOG
alias gl="git log --color"
alias gla="gl --all"

alias glo="gl --oneline"
alias gloa="glo --all"

alias glg="gl --graph"
alias glga="glg --all"

alias glog="glo --graph"
alias gloga="glog --all"

# LAZYGIT
alias lg="lazygit"

############
### Misc ###
############

set-hyprpaper() {
  # No Color
  local nc='\033[0m'
  # Regular
  # local black='\033[0;30m'
  local red='\033[0;31m'
  local green='\033[0;32m'
  # local yellow='\033[0;33m'
  # local blue='\033[0;34m'
  # local purple='\033[0;35m'
  # local cyan='\033[0;36m'
  # local white='\033[0;37m'

  if [[ "$#" -lt 1 ]] || [[ "$#" -gt 2 ]]; then
    echo -e "usage: set-hyprpaper <path> [monitor]" >&2
    return 1
  fi

  local preload_ret=$(hyprctl hyprpaper preload "$1")
  if [[ "$preload_ret" = "ok" ]]; then
    echo "${green}Wallpaper preload successful.${nc}"
  else
    echo "${red}Wallpaper preload unsuccessful.${nc}"
    echo "${red}Error: ${preload_ret}${nc}"
  fi

  local monitor=$2
  if [[ -z "$monitor" ]]; then
    if [[ -z "$MY_MONITOR" ]]; then
      echo -e "${red}MY_MONITOR variable is empty!${nc}" >&2
      echo -e "usage: set-hyprpaper <path> [monitor]" >&2
      return 2
    fi
    monitor=$MY_MONITOR
  fi

  local wallpaper_ret=$(hyprctl hyprpaper wallpaper "$monitor,$1")
  if [[ "$wallpaper_ret" = "ok" ]]; then
    echo "${green}Wallpaper is set.${nc}"
  else
    echo "${red}Wallpaper set unsuccessful.${nc}"
    echo "${red}Error: ${wallpaper_ret}${nc}"
  fi
}

alias nvim-kickstart='NVIM_APPNAME="nvim-kickstart" nvim'
alias vi="nvim"
alias vim="nvim"
alias imgcat="wezterm imgcat"

update-neovim-nightly() {
  emulate -LR zsh
  # local red='\033[0;31m'
  # local nc='\033[0m'
  local NEOVIM_REPO_PATH=~/.cache/paru/clone/neovim-nightly-bin
  (
  cd $NEOVIM_REPO_PATH
  makepkg -si --needed
  # local pull_ret=$(git pull)
  # if [[ "${pull_ret}" == 'Already up to date.' ]] then
  #   echo
  #   echo -e "Updating..."
  #   makepkg -si --needed
  # else
  #   echo
  #   echo -e "${red}There is an update in the aur.${nc}"
  #   echo
  # fi
  )
}

#####################
### Command Hooks ###
#####################

# autoload -Uz add-zsh-hook

# Is this like sending fn() instead of fn or ()=>{fn()} to a prop in react?
# add-zsh-hook -Uz chpwd (){ ls }

do-ls() { ls -a }
chpwd_functions+=(do-ls)

###############
### Plugins ###
###############

# export BAT_THEME=fly16

# fzf
# -- fzf configs
eval "$(fzf --zsh)"

export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --info=inline'

# --- <C-t> - Paste the selected files and directories onto the command-line
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"

# --- <C-r> - Paste the selected command from history onto the command-line
export FZF_CTRL_R_OPTS="
  --preview 'echo {}' --preview-window up:3:hidden:wrap
  --bind 'ctrl-/:toggle-preview'"

# --- <A-c> - cd into the selected directory
export FZF_ALT_C_OPTS="
  --walker-skip .git,node_modules
  --preview 'eza -1A --color=always --icons=always {}'"

# -- fzf completion
export FZF_COMPLETION_OPTS='--info=inline'

# --- The first argument to the function ($1) is the base path to start traversal
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza -1A --color=always --icons=always {} | head -200'  "$@" ;;
    export|unset) fzf --preview "eval 'echo \$'{}"                      "$@" ;;
    *)            fzf --preview 'bat -n --color=always {}'              "$@" ;;
  esac
}
# ----------

# fzf-tab
# NOTE: fzf-tab needs to be loaded after compinit,
#       but before plugins which will wrap widgets,
#       such as zsh-autosuggestions or fast-syntax-highlighting
zstyle ':completion:*:git-checkout:*' sort false
zstyle ':completion:*:git-diff:*' sort false
zstyle ':completion:*:git-log:*' sort false
zstyle ':completion:*:git-fetch:*' sort false
zstyle ':completion:*:git-branch:*' sort false

zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1A --color=always --icons=always $realpath'
zstyle ':fzf-tab:*' switch-group 'ctrl-h' 'ctrl-l'

source /usr/share/zsh/plugins/fzf-tab-git/fzf-tab.plugin.zsh
# ----------

eval "$(zoxide init zsh)"
# source /usr/share/nvm/init-nvm.sh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
## This needs to be at the end of the file
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

##############
### Zellij ###
##############

if [[ -z "$ZELLIJ" ]]; then
    if [[ "$ZELLIJ_AUTO_ATTACH" == "true" ]]; then
        zellij attach --create home
    else
        zellij
    fi

    if [[ "$ZELLIJ_AUTO_EXIT" == "true" ]]; then
        exit
    fi
fi
# zprof

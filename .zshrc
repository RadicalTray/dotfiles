# NOTE: REMINDER :D

~/.Scripts/reminder.sh

# -----------------

# History config
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# python venv [Load before activating prompt so it does not spam the prompt]
source ~/.Python-venv/bin/activate

# The following lines were added by compinstall
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

#####################
### CUSTOM PROMPT ###
#####################

autoload -Uz vcs_info
precmd() { vcs_info }

# Load Git branch info
zstyle ':vcs_info:git:*' formats '%b '

setopt PROMPT_SUBST

export PROMPT='%F{blue}%~%f %F{red}${vcs_info_msg_0_}%f
%F{green}$%f '

# Emacs keybinds
bindkey -e
# Keybinds
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word

# Aliases
# - System
alias mvy="mv"
alias rmy="rm"
alias cpy="cp"
alias mv="mv -i"
alias rm="rm -I"
alias cp="cp -i"
alias supacsyu="sudo pacman -Syu"
alias parusyu="paru -Syu --needed"
# - Convenience
alias sa="source ~/.zshrc;echo 'Config sourced.'"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias cl="clear"
alias ls="eza --color=auto --icons=auto"
alias l="ls"
alias ll="ls -lg"
alias la="ls -A"
alias lla="ll -A"
alias lal="lla"
alias grep="grep --color=auto"
alias cat="bat --color=auto"
# - Editor
alias vim="nvim"
# - Config
alias dotfiles='/usr/bin/git --git-dir="$HOME/.Dotfiles/" --work-tree="$HOME"'
alias nvim-config="cd ~/.config/nvim;nvim"
alias wezterm-config="cd ~/.config/wezterm;nvim"
# - Git
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
alias gfl="git fetch;git log HEAD..FETCH_HEAD"
alias gflo="git fetch;git log HEAD..FETCH_HEAD --oneline"
alias gfd="git fetch;git diff HEAD..FETCH_HEAD"

alias gl="git log --color"
alias glo="gl --oneline"
alias ggl="gl --graph"
alias glg="ggl"
alias glog="glo --graph"
alias gglo="glog"
alias glgo="glog"

alias gs="git status"
alias lg="lazygit"
# - Misc
alias imgcat="wezterm imgcat"
alias fm="clifm ."
alias update-neovim-nightly="(cd ~/.cache/paru/clone/neovim-nightly-bin;makepkg -si --needed)"

# Plugins
export BAT_THEME=rose-pine

# - fzf
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

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

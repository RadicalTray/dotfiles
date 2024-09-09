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

alias nvim-kickstart='NVIM_APPNAME="nvim-kickstart" nvim'
alias vi="nvim"
alias vim="nvim"
alias imgcat="wezterm imgcat"


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
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias cl="clear"
alias ls="ls --color=auto --classify=auto"
alias l="ls"
alias la="ls --almost-all"
alias ll="ls -l --human-readable"
alias lla="ls -l --almost-all --human-readable"
alias grep="grep --color=auto"
alias cat="bat --plain --color=auto"

# Config
alias dotfiles='/usr/bin/git --git-dir="$HOME/.Dotfiles/" --work-tree="$HOME"'
alias dotfiless='dotfiles status'
alias dotfilesa='dotfiles add'
alias dotfilesd='dotfiles diff'
alias dotfilesds='dotfiles diff --staged'
alias dotfilesc='dotfiles commit'
alias dotfilescm='dotfiles commit -m'
alias dotfilesca='dotfiles commit -a'
alias dotfilescam='dotfiles commit -a -m'

# Git
alias gs="git status"

alias ga="git add"
alias gau="git add --update"
alias gaa="git add --all"
alias gauc="git add --update; git commit"
alias gaac="git add --all; git commit"
alias gaucm="git add --update; git commit --message"
alias gaacm="git add --all; git commit --message"

alias gc="git commit"
alias gcm="git commit --message"
alias gca="git commit --all"
alias gcam="git commit --all --message"

alias gd="git diff"
alias gds="git diff --staged"

alias gl="git log"
alias glo="git log --oneline"
alias glg="git log --graph"
alias glog="git log --oneline --graph"

alias nvim-kickstart='NVIM_APPNAME="nvim-kickstart" nvim'
alias v="nvim"

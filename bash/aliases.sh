#!/usr/bin/env bash

# ls Aliases
alias l='ls --color --classify'
alias ll='l --all -l'
alias la='l --almost-all'

# General QoL Aliases
alias btw='neofetch'
alias hrg='history | rg'
alias refresh='clear && source $HOME/.bashrc'

# Git Aliases
alias g='git'
alias gs='git status'
alias ga='git add'
alias gp='git push'
alias gu='git pull'
alias gc='git commit'
alias go='git checkout'
alias gd='git diff'
alias gl='git log'
alias rprune="git remote prune origin && git_clean_local_branches"

# Python Aliases
alias py='python3'

# NVim Aliases
alias v='nvim'
alias vn='nvim +Note'  # Open the current daily note (DEP: note.vim plugin)

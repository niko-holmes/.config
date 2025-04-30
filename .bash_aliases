# General QoL Aliases
alias btw='neofetch'
alias hrg='history | rg'
alias refresh='clear && source $HOME/.bashrc'
alias v='nvim'

# Git Aliases
alias gs='git status'
alias ga='git add'
alias gp='git push'
alias gu='git pull'
alias gc='git commit'
alias go='git checkout'
alias gd='git diff'
alias gl='git log'

# Docker Aliases
alias dkr_stopall='docker stop $(docker ps -q) &> /dev/null || echo "No running containers"'

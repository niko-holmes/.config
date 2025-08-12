# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

HISTCONTROL=ignoreboth  # History ignores duplicate lines and lines with leading whitespace
HISTSIZE=1000
HISTFILESIZE=2000

shopt -s histappend     # Append to history file instead of overwriting
shopt -s checkwinsize   # Check window size after command and update LINES and COLUMNS


# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r $HOME/.dircolors && eval "$(dircolors -b $HOME/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
fi

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Alias definitions.
if [ -f $HOME/.config/bash/aliases ]; then
    . $HOME/.config/bash/aliases
fi

# Shadow Robot Specific aliases (not to be backed up in git)
if [ -f $HOME/.bash_aliases_sr ]; then
    . $HOME/.bash_aliases_sr
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('$HOME/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]; then
        . "$HOME/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export PATH="$PATH:/opt/nvim-linux-x86_64/bin"

# Source dx_hosts setup.sh, for working with DexEE
source $HOME/projects/shadow_robot/dx_system/host_scripts/setup.sh

# Shell Intergations (keep at bottom of .bashrc)
export STARSHIP_CONFIG=$HOME/.config/starship/config.toml
eval "$(starship init bash)"
eval "$(zoxide init --cmd cd bash)"


#!/usr/bin/env bash

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Set Bash Shell Options << https://www.gnu.org/software/bash/manual/html_node/The-Shopt-Builtin.html
shopt -s autocd           # typing a directory will cd into it
shopt -s nullglob         # glob misses will return null not glob text
shopt -s histappend       # append history on

# Set Command History Options << https://www.gnu.org/software/bash/manual/html_node/Bash-History-Facilities.html
HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000

# XDG Base Directories << https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
# export XDG_CACHE_HOME=$HOME/.cache
# export XDG_CONFIG_HOME=$HOME/.config
# export XDG_DATA_HOME=$HOME/.local/share
# export XDG_STATE_HOME=$HOME/.local/state

# Aliases
alias l='ls'        # normal ls
alias la='ls -a'    # show all (includes hidden)
alias ll='ls -l'    # long format
alias lla='ls -la'  # both

# ==================================================================================
# Autoloads
# ==================================================================================

# rust / cargo environment (if installed)
[[ -d "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"

# initialize starship prompt (if installed)
if command -v starship &>/dev/null; then
  eval "$(starship init bash)"
fi

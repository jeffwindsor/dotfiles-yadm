#!/usr/bin/env zsh

# avoids insecure directories issues
export ZSH_DISABLE_COMPFIX="true"

# xdg-ify
export XDG_STATE_HOME=$HOME/.local/state
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CACHE_HOME=$HOME/.cache
export XDG_CONFIG_HOME=$HOME/.config

# personal
export SRC=$HOME/Source
export EDITOR="$(which nvim)"


# homebrew
export PATH="/opt/homebrew/bin/:$PATH"

# fzf
export FZF_DEFAULT_COMMAND='fd --type f --hidden --ignore-file ~/.config/fdignore'
export FZF_DEFAULT_OPTS='--info=inline --reverse --border none --preview "bat {}" --preview-window down'

# git
export GIT_LOG_PRETTY_FORMAT='%C(green)%h%C(reset) - %s%C(cyan) | %an%C(dim) | %ch%C(auto)%d%C(reset)'

# node
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmconfig
export NPM_PACKAGES=$HOME/.npm-packages
export NVM_DIR="$XDG_DATA_HOME"/nvm

# ripgrep
export RIPGREP_CONFIG_PATH="$XDG_CONFIG_HOME/ripgrep/ripgreprc"

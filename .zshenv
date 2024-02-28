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

if command -v nvim &>/dev/null; then
  export EDITOR="$(which nvim)"
fi

# fzf
if command -v fzf &>/dev/null; then
  export FZF_DEFAULT_COMMAND='fd --type f --hidden --ignore-file ~/.config/fdignore'
  export FZF_DEFAULT_OPTS='--height 60% --info=inline'
fi

# git
if command -v git &>/dev/null; then
  export GIT_LOG_PRETTY_FORMAT='%C(green)%h%C(reset) - %s%C(cyan) | %an%C(dim) | %ch%C(auto)%d%C(reset)'
fi

# node
if command -v npm &>/dev/null; then
  export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmconfig
  export NPM_PACKAGES=$HOME/.npm-packages
  export NVM_DIR="$XDG_DATA_HOME"/nvm
fi

# ripgrep
if command -v rg &>/dev/null; then
  export RIPGREP_CONFIG_PATH="$XDG_CONFIG_HOME/ripgrep/ripgreprc"
fi

#brew installed completions
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
fi

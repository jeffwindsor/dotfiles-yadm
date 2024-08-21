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

# brew
export HOMEBREW_AUTO_UPDATE_SECS=43200

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

#==============================================================================
# ZSH Package Manager
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Zsh Plugins
zinit light zsh-users/zsh-syntax-highlighting
# zinit light zsh-users/zsh-completions
# zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

autoload -Uz compinit && compinit
zinit cdreplay -q
#==============================================================================

unsetopt BEEP

# Keybindings
bindkey -v
# bindkey '^p' history-search-backward
# bindkey '^n' history-search-forward
# bindkey '^[w' kill-region

# History 
HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
HISTSIZE=5000
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion Styling
# match on case independent values
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
# match display with color
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
# suppress because we are using fzf-tab
zstyle ':completion:*' menu no
# add previews to tab completes
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# homebrew
if [[ -f "/opt/homebrew/bin/brew" ]] then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# personal aliases - shell independent
if test -f $HOME/.aliasrc; then 
  source $HOME/.aliasrc
fi 

# fuzzy finder
if command -v fzf &>/dev/null; then
  eval "$(fzf --zsh)"
fi

# z-oxide: init replacing cd with z, and cdi with zi 
if command -v zoxide &>/dev/null; then
  eval "$(zoxide init --cmd cd zsh)"
fi

# starship prompt
if command -v starship &>/dev/null; then
  eval "$(starship init zsh)"
fi

# 
# only needed at CJ
#
if command -v nvm &>/dev/null; then
  mkdir -p $HOME/.nvm
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" 
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi

if command -v $(brew --prefix asdf)/libexec/asdf.sh &>/dev/null; then
  source $(brew --prefix asdf)/libexec/asdf.sh
fi

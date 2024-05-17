#!/usr/bin/env zsh


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
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

autoload -Uz compinit && compinit

# ZSH Options
#   scripts and functions
#setopt LOCAL_OPTIONS MULTIOS
#   expansion and globbing
#setopt EXTENDED_GLOB
#   completions
#setopt AUTO_MENU
#setopt ALWAYS_TO_END
#setopt AUTO_LIST
#setopt NO_MENU_COMPLETE
#setopt COMPLETE_IN_WORD
#setopt NOMATCH
#   job control
#setopt NOTIFY
#   prompting
#setopt PROMPT_SUBST
#   input / output
#unsetopt FLOW_CONTROL
#unsetopt CORRECT_ALL
#   zle
unsetopt BEEP
#   HISTORY
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

# Keybindings
bindkey -v
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region

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

# only needed at work
if command -v nvm &>/dev/null; then
  mkdir -p $HOME/.nvm
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" 
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi




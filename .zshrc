#!/usr/bin/env zsh

# Options
#   https://zsh.sourceforge.io/Doc/Release/Options.html
# scripts and functions
setopt LOCAL_OPTIONS MULTIOS
# expansion and globbing
setopt EXTENDED_GLOB
# completions
setopt AUTO_MENU ALWAYS_TO_END AUTO_LIST NO_MENU_COMPLETE COMPLETE_IN_WORD NOMATCH
# changing directories
setopt AUTO_CD AUTO_PUSHD CDABLE_VARS PUSHD_IGNORE_DUPS
# history
setopt EXTENDED_HISTORY HIST_EXPIRE_DUPS_FIRST HIST_IGNORE_DUPS HIST_IGNORE_SPACE INC_APPEND_HISTORY SHARE_HISTORY
# job control
setopt NOTIFY
# prompting
setopt PROMPT_SUBST
# input / output
unsetopt FLOW_CONTROL CORRECT_ALL
# zle
unsetopt BEEP

# Parameters
#   https://zsh.sourceforge.io/Doc/Release/Parameters.html
HISTSIZE=50000
SAVEHIST=10000


# shell independent aliases
if test -f $HOME/.aliasrc; then 
  source $HOME/.aliasrc
fi 

# z-oxide: cd replacement 
if test -f $XDG_DATA_HOME/zoxide/zoxide.zsh; then
  source $XDG_DATA_HOME/zoxide/zoxide.zsh
fi

# starship prompt
if command -v starship &>/dev/null; then
  eval "$(starship init zsh)"
fi

# zsh add ons
if type brew &>/dev/null; then
  BREW_FOLDER=$(brew --prefix)

  # zsh completions
  #FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  source $BREW_FOLDER/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  source $BREW_FOLDER/share/zsh-history-substring-search/zsh-history-substring-search.zsh
  source $BREW_FOLDER/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  # ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=white'

  autoload -Uz compinit
  compinit
fi

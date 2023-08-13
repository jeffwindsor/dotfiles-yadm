#!/usr/bin/env zsh
source .aliasrc

# fuzzy finding
if [ -n "${commands[fzf-share]}" ]; then
  source "$(fzf-share)/key-bindings.zsh"
  source "$(fzf-share)/completion.zsh"
fi

if [[ $(uname) == "Darwin" ]]; then

  # macos zsh add on inits
  [ -d /usr/local/share/zsh-syntax-highlighting ] && source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  [ -d /usr/local/share/zsh-autosuggestions ] && source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

elif command dnf &>/dev/null; then

  # fedora inits
  [ -d /usr/share/zsh-autosuggestions ] && source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  [ -d /usr/share/zsh-syntax-highlighting ] && source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

fi

# starship prompt
if command -v starship &>/dev/null; then
  eval "$(starship init zsh)"
fi

# ZSH Options
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

# ZSH Parameters
#   https://zsh.sourceforge.io/Doc/Release/Parameters.html
HISTSIZE=50000
SAVEHIST=10000

# ZSH Completions
#   https://zsh.sourceforge.io/Doc/Release/Completion-System.html
autoload -Uz compinit
compinit

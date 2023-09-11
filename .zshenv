#!/usr/bin/env zsh
source $HOME/.envrc

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
fi

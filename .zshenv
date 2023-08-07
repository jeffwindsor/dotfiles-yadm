#!/usr/bin/env zsh

# xdg-ify
export XDG_STATE_HOME=$HOME/.local/state
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CACHE_HOME=$HOME/.cache
export XDG_CONFIG_HOME=$HOME/.config

# personal
export EDITOR="$(which nvim)"
export SRC=$HOME/Source
export DOTFILES=$HOME/.config/
export INSTALLS=$HOME/.config/installs

# homebrew
export PATH="/usr/local/sbin:$PATH"

# cj
if [[ $(uname) == "Darwin" ]]; then
    export AWS_DEFAULT_REGION=us-west-1
    #export PATH="$PATH:$JAVA_HOME/bin"
    export PATH="$PATH:$SOFTWARE_HOME/bin"
    export PATH="$PATH:$SOFTWARE_HOME/resin"
    export CLASSPATH="$SOFTWARE_HOME/bin:$CLASSPATH"
    export DEVDB_HOST=devdb.db.cj.com
    export DEVDB_PORT=1521
    export DEVDB_SID=devdb
    export DEVDB_USERNAME=spud
    export DYLD_LIBRARY_PATH="$SOFTWARE_HOME/sqlplus/darwin"
    export JAVA_HOME="/usr/libexec/java_home -v 11"
    export MAVEN_OPTS="-Xmx8G -Xss3m -XX:ReservedCodeCacheSize=256m"
    export PATH="/usr/local/opt/openjdk@11/bin:$PATH"
    export PROJECTS_DIR="$HOME/.local/cjdev"
    export SOFTWARE_HOME="$PROJECTS_DIR"
    export TNS_ADMIN="$SOFTWARE_HOME/ci/tns-admin/"
    export DOCKER_HOST=unix:///Users/$USER/.colima/docker.sock
fi

# fzf
export FZF_DEFAULT_COMMAND='fd --type f --hidden --ignore-file ~/.config/fdignore'
export FZF_DEFAULT_OPTS='--height 60% --layout=reverse --info=inline'

# git
export GIT_LOG_PRETTY_FORMAT='%C(green)%h%C(auto)%d%C(reset) - %s | %C(cyan)%an %C(dim)%cr%C(reset)'

# node
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmconfig
export NPM_PACKAGES=$HOME/.npm-packages
export NVM_DIR="$XDG_DATA_HOME"/nvm

# ripgrep
export RIPGREP_CONFIG_PATH="$XDG_CONFIG_HOME/ripgrep/ripgreprc"

# rust
[[ -d "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"

# zsh
#export ZDOTDIR=$HOME/.config/zsh
#export HISTFILE=$XDG_CACHE_HOME/zsh/zsh_history   # put history to cache, seperating it from the other ZDOT files


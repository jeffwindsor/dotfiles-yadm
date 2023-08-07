#!/usr/bin/env zsh

# Modules
#   https://zsh.sourceforge.io/Doc/Release/Zsh-Modules.html
# zmodload zsh/zprof            # uncomment to profile startup times.  use `zprof` command to view results

# Shell Functions
#   https://zsh.sourceforge.io/Intro/intro_4.html


# Aliases
alias ....='cd ../../../'
alias ...='cd ../../'
alias ..='cd ..'
alias business="cd $SRC/github.com/jeffwindsor/financials/gnucash/business/imports"
alias dot="cd $DOTFILES"
alias home="cd $SRC/github.com/jeffwindsor/financials/gnucash/home/imports"
alias hub="cd $SRC/github.com"
alias in="cd $INSTALLS"
alias jeff="cd $SRC/github.com/jeffwindsor/"
alias md="cd $HOME/portable/exocortex/markdown"
alias src="cd $SRC"

alias hubs="exec-on-git-repos cd $SRC/github.com/"
alias srcs="exec-on-git-repos cd $SRC"
alias theme="$XDG_CONFIG_HOME/alacritty/change_theme"
alias zs="$EDITOR -c \":args $HOME/.zshrc $HOME/.zshenv $HOME/.bashrc\""

if command -v bat &>/dev/null; then
    alias cat='bat --style=plain'
fi

# dotfile management
if command -v yadm &>/dev/null; then
  # function yadm-list() { yadm list -a | sd '^' "$HOME/" }
  # function yadm-add-modified(){ yadm-list | xargs yadm add }
  function yadm-commit(){ yadm commit -m ${1:-'Refactor'} }
  function yadm-commit-push(){ yadm commit -m ${1:-'Refactor'} && yadm push}
  # function yadm-add-modified-commit-push(){ yadm-add-modified && yadm-commit $1 && yadm push }
  function yadm-log-graph(){ yadm log --graph --pretty=format:${GIT_LOG_PRETTY_FORMAT} --abbrev-commit --max-count=${1:-10} }
  # `d` for dotifles
  alias d="yadm"
  alias da="yadm add"
  alias ds="yadm status -sb --ignore-submodules"
  # alias dup="yadm-add-modified-commit-push"
  alias dup="yadm-commit-push"

  # alias daa="yadm-add-modified"
  alias dcm="yadm-commit"
  alias dl="yadm-log-graph"
  alias dll="yadm log"
  alias dph="yadm push"
  alias dpl="yadm pull"
  alias dr="yadm remote -vv"

  alias change="$EDITOR -c \":args $HOME/.config/installs/nixos/**/*.nix\""
  alias stow="yadm add $HOME/.config/installs/nixos/**/*.nix"
fi

# grep
if command -v rg &>/dev/null; then
  alias grep='rg'
  alias ar='alias | rg'
fi

# list
if command -v exa &>/dev/null; then
  alias l='exa -F --group-directories-first'
  alias la='exa -F --group-directories-first --git --all'
  alias ll='exa -lF --group-directories-first'
  alias lla='exa -lF --group-directories-first --git --all'
  alias tree='exa -lF --tree --git --all'
else
  alias l='ls'
  alias la='ls -a'
  alias ll='ls -l'
  alias lla='ls -la'
fi

if command -v freshfetch &>/dev/null; then
  alias f='freshfetch'
fi

# fuzzy finding
if [ -n "${commands[fzf-share]}" ]; then
  source "$(fzf-share)/key-bindings.zsh"
  source "$(fzf-share)/completion.zsh"
fi

# source control
if command -v git &>/dev/null; then

  # git commit with a default comment of 'Refactor'
  function git-commit(){ git commit -m ${1:-'Refactor'} }
  function git-add-commit(){ git add --all && git-commit $1 }
  function git-add-commit-push(){ git-add-commit $1 && git push }
  # pretty git log using format set in .zshenv: GIT_LOG_PRETTY_FORMAT. Max count defaults to 10
  function git-log-graph(){ git log --graph --pretty=format:${GIT_LOG_PRETTY_FORMAT} --abbrev-commit --max-count=${1:-10} }
  # find all directories ending in .git (including hidden and ignored listings)
  function git-find-dirs(){ fd '^.git$' $1 -HItd --max-depth 4 | sed 's/.git\/$//' }
  # apply git command to current directory contents
  function git-all(){ ls | xargs -I{} git -C {} $1 }
  # prompt user to select from list of git directories under $2 and if user selects one, execute command $1 on it
  function exec-on-git-repos() {
    local result=$(git-find-dirs $2 | fzf --reverse)
    [ ! -z "$result" ] && $1 $result
  }
  # git clone from git hub to my source directory
  function ghc(){ git clone git@github.com:$1 $SRC/github.com/$1 }

  alias git-to-main="git branch -m master main && git push -u origin main"
  alias ga="git add"
  alias gaa="git add --all"
  alias gb="git branch -v"
  alias gc="git clone"
  alias gcm="git-commit"
  alias gcma="git add --all && git-commit"
  alias gco="git checkout"
  alias gd="git diff --ignore-space-at-eol -b -w --ignore-blank-lines"
  alias gl="git-log-graph"
  alias gll="git log"
  alias gph="git push"
  alias gpl="git pull"
  alias gpls="git-all pull"
  alias gr="git remote -vv"
  alias gs="git status -sb --ignore-submodules"
  alias gup="git-add-commit-push"
  alias gsync="git checkout master && git pull --rebase && git checkout - && git rebase master"
fi
if command -v gitui &>/dev/null; then
  alias gu=gitui
fi
if command -v lazygit &>/dev/null; then
  alias lg=lazygit
fi

# editors
if command -v hx &>/dev/null; then
  alias h='hx'
  alias exo='hx ~/portable/exocortex'
fi
if command -v nvim &>/dev/null; then
  # yadm list -a | sd '^' "$HOME/"

  function yadm-list() {
    yadm list -a | sed -r '/^\s*$/d' | sd '^' "$HOME/"
  }

  alias v='nvim'
  alias fins="nvim -c \":Telescope find_files cwd=$HOME/portable/financials\""
  alias configs="nvim -c \":Telescope find_files cwd=$XDG_CONFIG_HOME\""
  alias dots="nvim -c \":Telescope find_files find_command=yadm-list\""
  alias dots2="nvim -c \":Telescope find_files find_command='yadm','list','-a'\""
  alias ins="nvim -c \":Telescope find_files cwd=$INSTALLS\""
fi

# version manager
# if command -v rtx &>/dev/null; then
#   eval "$(rtx activate zsh)"
#   alias ri="rtx install"
#   alias rl="rtx list"
#   alias ru="rtx use"
# fi
if command -v fnm &>/dev/null; then
  eval "$(fnm env --use-on-cd)"
fi

#
# Operating System Specific Settings
#

# MACOS / DARWIN
if [[ $(uname) == "Darwin" ]]; then
  # macos ls colorized
  export CLICOLOR=1

  # cj
  alias lab="cd $SRC/gitlab.cj.dev"
  alias labs="exec-on-git-repos cd $SRC/gitlab.cj.dev"
  alias cj="$EDITOR $HOME/portable/exocortex/cj"
  alias dbstart="nohup VBoxHeadless --startvm "Oracle11g32" &> /dev/null &"
  alias dbstop="VBoxManage controlvm Oracle11g32 poweroff"
  alias emp="cd $SRC/gitlab.cj.dev/empire"
  alias emps="exec-on-git-repos cd $SRC/gitlab.cj.dev/empire"
  alias java8="sdk use java 8.302.08.1-amzn"
  alias qb="java8 && mvn clean install -T 1C -Ddelta.skip=true -Dcleanup.skip=true -Dqunit.numThreads=8 -DskipTests -Dtablespaces.skip=true -Dgulp.task=min && java11"
  alias qqb="java8 && mvn install -T 1C -Ddelta.skip=true -Dcleanup.skip=true -Dqunit.numThreads=8 -DskipTests -Dtablespaces.skip=true -Dgulp.task=min && java11"
  alias sdk-start="source $HOME/.sdkman/bin/sdkman-init.sh"
  alias shopcart="rlwrap sqlplus jwindsor@shopcart.db.cj.com:1531/shopcart"
  alias shuttle-init="$HOME/.local/scripts/cj/shuttle-init"
  alias t1="rlwrap sqlplus cj@tcjoweb1.db.cj.com:1521/tcjoweb1"
  alias t5="rlwrap sqlplus cj@tcjoweb5.db.cj.com:1521/tcjoweb5"
  alias test-schemas="java -jar ./target/schemas-main-SNAPSHOT.one-jar.jar locator=T5 tnsnames=/USers/jwindsor/.local/cjdev/ci/tns-admin/tnsnames.ora"
  alias tns="v ~/.local/cjdev/ci/tns-admin/tnsnames.ora"
  alias nvm=fnm

  # fzf
  [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]] && export PATH="${PATH:+${PATH}:}/usr/local/opt/fzf/bin"

  # zsh add on inits
  [ -d /usr/local/share/zsh-syntax-highlighting ] && source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  [ -d /usr/local/share/zsh-autosuggestions ] && source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# FEDORA (all flavors)
elif command dnf &>/dev/null; then
  # dnf package manager
  alias da="sudo dnf autoremove"
  alias df="sudo dnf info"
  alias di="sudo dnf install"
  alias dit="sudo dnf --enablerepo=updates-testing,updates-testing-modular --best install"
  alias dls="dnf history --userinstalled"
  alias up="sudo dnf upgrade"
  # alias change="$EDITOR $HOME/.config/installs/fedora"

  # fedora inits
  [ -d /usr/share/zsh-autosuggestions ] && source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  [ -d /usr/share/zsh-syntax-highlighting ] && source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# NIXOS
elif [ -d "/etc/nixos" ]; then
  alias clean="nix-env --delete-generations +2 && nix-collect-garbage"
  alias list="sudo nix-env --list-generations --profile /nix/var/nix/profiles/system"
  alias optimize="nix optimise-store"
  alias rebuild="sudo cp -r $HOME/.config/installs/nixos/* /etc/nixos/ && sudo nixos-rebuild switch"
  alias up="sudo nixos-rebuild switch --upgrade"

  # zsh plugins are set up in configuraiton.nix
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

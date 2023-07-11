#!/usr/bin/env bash
cd "$(dirname "${0}")"

#
#   ███╗   ███╗ █████╗  ██████╗ ██████╗ ███████╗
#   ████╗ ████║██╔══██╗██╔════╝██╔═══██╗██╔════╝
#   ██╔████╔██║███████║██║     ██║   ██║███████╗
#   ██║╚██╔╝██║██╔══██║██║     ██║   ██║╚════██║
#   ██║ ╚═╝ ██║██║  ██║╚██████╗╚██████╔╝███████║
#   ╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝ ╚═════╝ ╚══════╝
#

##########################################################
read -r -p "Add Homebrew? [y/n] " response
if [[ "$response" =~ ^(yes|y)$ ]]
then
    xcode-select --install

    # homebrew
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

    brew tap homebrew/core
    brew tap homebrew/cask
    brew tap homebrew/cask-fonts
    brew tap homebrew/services

fi

##########################################################
brew install bat
brew install exa
brew install fd
brew install fzf
brew install git
brew install ripgrep
brew install starship
brew install tldr
brew install topgrade
brew install zsh-autosuggestions
brew install zsh-completions
brew install zsh-history-substring-search
brew install zsh-syntax-highlighting

brew install aws-cdk
brew install awscli
brew install colima docker
#brew install cassandra
#brew install clojure
#brew install kafka
brew install koekeishiya/formulae/skhd  && brew services start skhd
brew install maven
#brew install maven-completion
#brew install selenium-server-standalone

brew tap InstantClientTap/instantclient
brew install instantclient-basic
brew install instantclient-sqlplus
brew install alacritty
brew install alfred
brew install Amethyst
brew install keepingyouawake
brew install slack
brew install spotify
brew install spaceid

################################################################
read -r -p "Add SDKMAN? [y/n] " response
if [[ "$response" =~ ^(yes|y)$ ]]
then
    echo "==> SDKMAN"
    curl -s "https://get.sdkman.io" | bash

    echo "==> initial source SDKMAN"
    source "$HOME/.sdkman/bin/sdkman-init.sh"
    sdk install java
    skd install scala
fi

################################################################
# source ./shared/sshkeys
# source ./shared/gitclones

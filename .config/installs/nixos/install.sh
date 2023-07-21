#!/usr/bin/env bash

cd "$(dirname "${0}")" || exit
clear

# create initial ssh key if one does not exist
if [[ ! -f $HOME/.ssh/id_ed25519 ]]; then
  echo "==> Creating SSH Key"
  ssh-keygen -t ed25519 -C "jeff.windsor@gmail.com"
  eval "$(ssh-agent -s)"
  ssh-add ~/.ssh/id_ed25519
fi

# pause to have user add key to github
echo "==> Manually Add SSH key below to Github"
cat $HOME/.ssh/*.pub
echo "Hit Any key to continue"
read -r

# get dotfiles
nix-shell -p yadm --run "yadm clone git@github.com:jeffwindsor/dotfiles.git"

# copy latest config from dotfiles to etc
sudo cp -r $HOME/.config/installs/nixos/*.nix /etc/nixos/

# rebuild nixos
sudo nixos-rebuild switch --upgrade

# post setup
source $HOME/.config/installs/shared/gnome.sh
source $HOME/.config/installs/shared/github.sh
source $HOME/.config/installs/shared/flatpak.sh

# reboot to capture all changes
systemctl reboot

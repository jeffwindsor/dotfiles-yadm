#!/usr/bin/env bash

cd "$(dirname "${0}")" || exit
clear

# create a ssh key if one does not exist
if [[ ! -f $HOME/.ssh/id_ed25519 ]]; then
  echo "==> Creating SSH Key"
  ssh-keygen -t ed25519 -C "jeff.windsor@gmail.com"
  eval "$(ssh-agent -s)"
  ssh-add ~/.ssh/id_ed25519
fi

echo "==> Manually Add SSH key below to Github"
cat $HOME/.ssh/*.pub
echo "Hit Any key to continue"
read -r

echo "==> Cloning dotfiles"
nix-shell -p yadm --run "yadm clone git@github.com:jeffwindsor/dotfiles.git"

echo "==> Apply NixOs configuration"
sudo cp -r $HOME/.config/installs/nixos/*.nix /etc/nixos/
sudo nixos-rebuild switch --upgrade

echo "==> Post: Gnome Configuration"
source $HOME/.config/installs/shared/gnome.sh
echo "==> Post: Clone Repos"
source $HOME/.config/installs/shared/github.sh
echo "==> Post: Flatpaks"
source $HOME/.config/installs/shared/flatpaks.sh

# reboot to capture all changes
systemctl reboot

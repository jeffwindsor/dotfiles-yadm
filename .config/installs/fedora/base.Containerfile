FROM registry.fedoraproject.org/fedora-toolbox:latest
###############################################################################
# packages
RUN dnf -y install bat
RUN dnf -y install exa
RUN dnf -y install entr
RUN dnf -y install fd-find
RUN dnf -y install fortune-mod
RUN dnf -y install fzf
RUN dnf -y install ranger
RUN dnf -y install ripgrep
RUN dnf -y install sd
RUN dnf -y install shellcheck
RUN dnf -y install tealdeer

RUN dnf -y install jetbrains-mono-fonts
RUN dnf -y install zsh zsh-autosuggestions zsh-syntax-highlighting

# neovim
RUN dnf -y install neovim gcc "gcc-c++" glibc-all-langpacks
RUN git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# chezmoi
RUN sh -c "$(curl -fsLS get.chezmoi.io)"
RUN mv ./bin/chezmoi /usr/local/bin/

###############################################################################
# needed for copr enable
RUN dnf -y install 'dnf-command(copr)'

# starship prompt
RUN dnf -y copr enable atim/starship
RUN dnf -y install starship


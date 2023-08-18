##################################################################################
## DEVELOPMENT OS
##################################################################################
{ config, pkgs, ... }:{

  imports = [
    ./configuration-base-os.nix # hardware setup
    ./zsh.nix                   # personal module for zsh
  ];

  # System Packages || https://search.nixos.org/packages
  environment.systemPackages = with pkgs; [
    alacritty                   # terminal improvement
    bat                         # cat replacement
    distrobox                   # wrapper for podman that links home to containers for easy test and dev envs
    exa                         # ls replacement
    fd                          # find replacement
    fortune                     # sayings that make my day
    fzf                         # fuzzy finder
    gcc                         # c compiler
    git                         # source control
    gitui                       # source control tui
    helix                       # editor (kakoune like)
    jetbrains-mono              # font
    megasync                    # cloud storage
    neovim                      # editor (vim like)
    podman                      # container (non-root) service
    ripgrep                     # grep replacement
    sd                          # sed replacement
    starship                    # prompt
    tealdeer                    # tldr replacement
    xplr                        # tui file explorer
    yadm                        # dotfile management
    zellij                      # tmux replacement
  ];

  #  NixOs Options- Allow Flakes || https://search.nixos.org/options
  nix.settings.experimental-features = ["nix-command" "flakes"];

}

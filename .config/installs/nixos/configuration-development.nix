##################################################################################
## DEVELOPMENT OS - POWER OF THE COMMAND LINE
##################################################################################
{ config, pkgs, ... }:{

  imports = [
    ./configuration-base-os.nix # hardware setup
    ./zsh.nix                   # personal module for zsh
  ];

  # System Packages || https://search.nixos.org/packages
  environment.systemPackages = with pkgs; [

    # ui tools
    alacritty                   # terminal
    megasync                    # mega cloud storage

    # container dev
    devbox                      # Instant, easy, predictable shells and containers.
    distrobox                   # wrapper for podman that links home to containers for easy test and dev envs
    podman                      # container (non-root) service

    # command line tools
    bat                         # cat replacement
    exa                         # ls replacement
    fd                          # find replacement
    fortune                     # sayings that make my day
    fzf                         # fuzzy finder
    gcc                         # c compiler
    git                         # source control
    gitui                       # source control tui
    helix                       # editor (kakoune like)
    neovim                      # editor (vim like)
    ripgrep                     # grep replacement
    sd                          # sed replacement
    starship                    # prompt
    tealdeer                    # tldr replacement
    xplr                        # tui file explorer
    yadm                        # dotfile management
    zellij                      # tmux replacement

    # fonts
    jetbrains-mono
    fira-code

  ];

  #  NixOs Options- Allow Flakes || https://search.nixos.org/options
  nix.settings.experimental-features = ["nix-command" "flakes"];

}

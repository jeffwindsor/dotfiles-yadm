{ config, pkgs, ... }:{

  imports = [
    ./gnome.nix
    ./framework-laptop.nix
    ./hardware-configuration.nix
  ];

  # ==========================================
  #  NixOs Options
  #   https://search.nixos.org/options
  # ==========================================
  users.users.mid = {
    isNormalUser  = true;
    description   = "The Middle Way";
    extraGroups   = [ "networkmanager" "wheel" ];
    packages      = with pkgs; [];
  };

  # ==========================================
  # Packages
  #   https://search.nixos.org/packages
  # ==========================================
  services.flatpak.enable = true;             # allow for user installed packages via flatpak
  environment.systemPackages = with pkgs; [

    # applications
    alacritty                                 # terminal improvement
    megasync                                  # cloud storage

    # containers
    devbox                                    # instant, easy, predictable shells and containers.
    distrobox                                 # wrapper for podman that links home to containers for easy test and dev envs
    podman                                    # container (non-root) service

    # command line tools
    gcc                                       # c compiler
    git                                       # source control
    lazygit                                   # tui git client
    helix                                     # editor (kakoune like)
    neovim                                    # editor (vim like)
    fortune                                   # saying that make my day
    yadm                                      # dotfile management
    bat                                       # cat replacement
    exa                                       # ls replacement
    fd                                        # find replacement
    freshfetch                                # neofetch replacement
    fzf                                       # fuzzy finder
    ripgrep                                   # grep replacement
    sd                                        # sed replacement
    starship                                  # prompt
    tealdeer                                  # tldr replacement
    xplr                                      # tui file explorer
    zellij                                    # tmux replacement

    # shells
    zsh
    zsh-autosuggestions
    zsh-syntax-highlighting

    # fonts
    jetbrains-mono
    lexend                                    # A variable font family designed to aid in reading proficiency
    nerdfonts

  ];

}

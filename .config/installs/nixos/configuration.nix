{ config, pkgs, ... }:{

  imports = [
    ./gnome.nix
    ./zsh.nix
    ./framework-laptop.nix
    ./hardware-configuration.nix
  ];

  # ==========================================
  # NixOs Options
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

    ## applications
    alacritty                                 # terminal improvement
    megasync                                  # cloud storage

    ## browsers
    firefox
    chromium
    librewolf
    brave

    ## command line tools
    fd                                        # find replacement
    fortune                                   # saying that make my day
    freshfetch                                # neofetch replacement
    fzf                                       # fuzzy finder
    gcc                                       # c compiler
    git                                       # source control
    helix                                     # editor (kakoune like)
    lazygit                                   # tui git client
    neovim                                    # editor (vim like)
    nushell                                   # modern shell written in Rust
    ripgrep                                   # grep replacement
    sd                                        # sed replacement
    starship                                  # prompt
    tealdeer                                  # tldr replacement
    xplr                                      # tui file explorer
    yadm                                      # dotfile management
    xh                                        # curl replacement
    zellij                                    # tmux replacement

    # fonts
    jetbrains-mono
    lexend                                    # A variable font family designed to aid in reading proficiency
    nerdfonts

  ];

}

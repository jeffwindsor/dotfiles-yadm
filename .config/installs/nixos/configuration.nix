{ config, pkgs, ... }:{                       # https://search.nixos.org/options

  imports = [
    <home-manager/nixos>
    ./gnome.nix                               # add personalized gnome de
    ./hardware-configuration.nix              # generated hardware config
  ];

  boot = {
    loader = {
      systemd-boot.enable = true;             # EFI boot manager
      efi.canTouchEfiVariables = true;        # installation can modify EFI boot variables
    };

    supportedFilesystems = [ "ntfs" ];        # USB Drives might have this format
  };

  environment = {
    pathsToLink = [ "/share/zsh" ];

    shells = with pkgs; [
      bash
      nushell
      zsh
    ];

    systemPackages = with pkgs; [
      # browsers
      firefox                                 # main
      chromium                                # backup
      brave                                   # backup


      # applications
      #alacritty                               # terminal improvement
      megasync                                # cloud storage
      neovim                                  # editor (vim like)

      # cli tools
      #bat                                     # cat replacement
      exa                                     # ls replacement
      fortune                                 # saying that make my day
      #fzf                                     # fuzzy finder
      gcc                                     # c compiler, required for nvim+treesitter
      #git                                     # source control
      ripgrep                                 # grep replacement
      #starship                                # prompt
      #tealdeer                                # tldr replacement
      yadm                                    # dotfile management
      # zsh                                     # main shell
      # zsh-autosuggestions
      # zsh-syntax-highlighting

      # fonts
      jetbrains-mono                          # main font
      lexend
      nerdfonts

      # system
      cups-brother-hll2350dw                  # home and office printer (2023)
      fwupd                                   # firmware update service
      tlp                                     # laptop power mgmt service

      # experimental use : maybe keep
      #lazygit                                 # tui git client
      sd                                      # sed replacement
      fd                                      # find replacement
      freshfetch                              # neofetch replacement
      helix                                   # editor (kakoune like)
      xh                                      # curl replacement
      xplr                                    # tui file explorer
      zellij                                  # tmux replacement
      nushell                                 # modern shell written in Rust
      qutebrowser                             # browser (vim like)
      #nytx                                    # browser (keyboard only)
      #librewolf                               # browser (stripped down firefox)

    ];

  };

  # AUDIO: turn off default pulse audio to use pipewire
  hardware.pulseaudio.enable = false;

  networking= {
    hostName = "frame";
    networkmanager.enable = true;             # Wifi Manager
  };

  # PACKAGES: remove unfree check
  nixpkgs.config.allowUnfree = true;

  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
    };

    # GARBAGE COLLECTION: https://nixos.wiki/wiki/Storage_optimization#Automation
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  programs = {
    zsh = {
      enable = true;
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;
    };
  };

  # AUDIO: used by pipewire
  security.rtkit.enable = true;

  services = {
    # PRINTING: service discovery on a local network
    avahi = {
      enable = true;
      nssmdns = true;
      openFirewall = true;                  # Wifi printing
    };

    # FLATPAK: user installeble
    flatpak.enable = true;

    # AUDIO: sound services
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

    # PRINTING: standard printing services
    printing = {
      enable = true;
      drivers = [ pkgs.cups-brother-hll2350dw ];
    };

  };

  system = {
    autoUpgrade.enable = true;
    stateVersion = "23.05";
  };

  time.timeZone = "America/Los_Angeles";

  users.users.mid = {
    isNormalUser = true;
    description = "The Middle Way";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
    packages = with pkgs; [
    ];
  };

  home-manager = {
    useGlobalPkgs = true;                     # use nixos system packages
    useUserPackages = true;                   # use nixos user packages
    users.mid = import ./home.nix;
  };

}

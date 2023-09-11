{ config, pkgs, ... }:{                       # https://search.nixos.org/options

  imports = [
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
    shells = with pkgs; [
      bash
      nushell
      zsh
    ];

    systemPackages = with pkgs; [
      cups-brother-hll2350dw                  # home and office printer (2023)
      fwupd                                   # firmware update service
      tlp                                     # laptop power mgmt service
    ];

  };

  hardware.pulseaudio.enable = false;         # AUDIO: turn off default pulse audio to use pipewire

  networking= {
    hostName              = "frame";
    networkmanager.enable = true;             # Wifi Manager
  };

  nixpkgs.config.allowUnfree = true;          # allow more packages

  nix = {
    settings = {
      auto-optimise-store   = true;
      experimental-features = [ "nix-command" "flakes" ];
    };
    gc = {
      automatic = true;                       # https://nixos.wiki/wiki/Storage_optimization#Automation
      dates     = "weekly";
      options   = "--delete-older-than 7d";
    };
  };

  programs = {
    zsh = {                                   # ZSH
      enable                    = true;
      autosuggestions.enable    = true;
      syntaxHighlighting.enable = true;
    };
  };

  security.rtkit.enable = true;               # AUDIO: used by pipewire

  services = {

    avahi = {                                 # PRINTING: service discovery on a local network
      enable        = true;
      nssmdns       = true;
      openFirewall  = true;                   # Wifi printing
    };

    flatpak ={
      enable = true;                          # allow for user installed packages via flatpak
    };

    pipewire = {                              # AUDIO: sound services
      enable            = true;
      alsa.enable       = true;
      alsa.support32Bit = true;
      pulse.enable      = true;
    };

    printing = {                              # PRINTING: standard printing services
      enable  = true;
      drivers = [ pkgs.cups-brother-hll2350dw ];
    };

  };

  system = {
    autoUpgrade.enable  = true;               # auto upgrade nixos and nix packages
    stateVersion        = "23.05";
  };

  time.timeZone = "America/Los_Angeles";

  users.users.mid = {
    isNormalUser  = true;
    description   = "The Middle Way";
    extraGroups   = [ "networkmanager" "wheel" ];
    shell         = pkgs.zsh;
    packages      = with pkgs; [
      # applications
      alacritty                               # terminal improvement
      brave                                   # experimental: browser
      chromium                                # browser backup
      firefox                                 # browser main
      helix                                   # experimental: editor (kakoune like)
      librewolf                               # experimental: browser
      megasync                                # cloud storage
      neovim                                  # editor (vim like)

      # tools
      bat                                     # cat replacement
      exa                                     # ls replacement
      fd                                      # experimental: find replacement
      fortune                                 # saying that make my day
      freshfetch                              # experimental: neofetch replacement
      fzf                                     # fuzzy finder
      gcc                                     # c compiler
      git                                     # source control
      lazygit                                 # experimental: tui git client
      ripgrep                                 # grep replacement
      sd                                      # experimental: sed replacement
      starship                                # prompt
      tealdeer                                # tldr replacement
      xh                                      # experimental: curl replacement
      xplr                                    # experimental: tui file explorer
      yadm                                    # dotfile management
      zellij                                  # experimental: tmux replacement

      # shells
      nushell                                 # experimental: modern shell written in Rust
      zsh                                     # main shell
      zsh-autosuggestions
      zsh-syntax-highlighting

      # fonts
      jetbrains-mono                          # main font
      lexend
      nerdfonts
    ];
  };

}

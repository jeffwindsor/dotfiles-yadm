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
      # applications
      alacritty                               # terminal improvement
      brave                                   # maybe keep: browser
      chromium                                # browser (backup)
      firefox                                 # browser (main)
      helix                                   # maybe keep: editor (kakoune like)
      librewolf                               # maybe keep: browser
      megasync                                # cloud storage
      neovim                                  # editor (vim like)

      # tools
      bat                                     # cat replacement
      exa                                     # ls replacement
      fd                                      # maybe keep: find replacement
      fortune                                 # saying that make my day
      freshfetch                              # maybe keep: neofetch replacement
      fzf                                     # fuzzy finder
      gcc                                     # c compiler
      git                                     # source control
      lazygit                                 # maybe keep: tui git client
      ripgrep                                 # grep replacement
      sd                                      # maybe keep: sed replacement
      starship                                # prompt
      tealdeer                                # tldr replacement
      xh                                      # maybe keep: curl replacement
      xplr                                    # maybe keep: tui file explorer
      yadm                                    # dotfile management
      zellij                                  # maybe keep: tmux replacement

      # shells
      nushell                                 # maybe keep: modern shell written in Rust
      zsh                                     # main shell
      zsh-autosuggestions
      zsh-syntax-highlighting

      # fonts
      jetbrains-mono                          # main font
      lexend
      nerdfonts

      # system
      cups-brother-hll2350dw                  # home and office printer (2023)
      fwupd                                   # firmware update service
      tlp                                     # laptop power mgmt service
    ];

  };

  # AUDIO: turn off default pulse audio to use pipewire
  hardware.pulseaudio.enable = false;

  networking= {
    hostName = "frame";
    networkmanager.enable = true;             # Wifi Manager
  };

  # remove unfree check
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

}

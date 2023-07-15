{ config, pkgs, ... }:{

  imports = [
    ./module/gnome.nix
    ./module/nixos.nix
    ./module/zsh.nix

    ./module/audio.nix
    ./module/laptop.nix
    ./module/ntfs.nix
    ./module/printing.nix

    ./hardware-configuration.nix
  ];

  networking.hostName = "frame";
  time.timeZone       = "America/Los_Angeles";
  system.stateVersion = "23.05";

  # users
  users.users.mid = {
    isNormalUser  = true;
    description   = "The Middle Way";
    extraGroups   = [ "networkmanager" "wheel" ];
  };

  #flatpak
  services.flatpak.enable = true;


  # system wide packages, can put packages per user just no need yet
  environment.systemPackages = with pkgs; [

    # terminals
    alacritty

    # fonts
    jetbrains-mono

    # dotfile management
    yadm

    # editors
    helix
    neovim

    # source control
    git
    gitui

    # new hotness command line utils
    bat           # cat
    exa           # ls
    fd            # find
    freshfetch    # neofetch replacement
    fzf           # fuzzy finder
    gcc           # c compiler
    ripgrep       # grep
    sd            # sed
    starship      # prompt
    tealdeer      # tldr
    xplr          # tui file explorer
    zellij        # tmux

    # applications (trying flatpaks)
    # audacity      # sound engineering
    # gimp          # image manipulation
    # gnucash       # double entry accounting
    # libreoffice   # office suite
    # megasync      # cloud storage
    # newsflash     # rss
    # obsidian      # markdown editor
    # spotify       # music service
    # transmission-gtk  # bit torrent
    # vlc           # media player
    # brave
    # firefox
    # librewolf
    # google-chrome
    # chromium

  ];

}

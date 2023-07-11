{ config, pkgs, ... }:{

  imports = [
    ./desktop/gnome.nix
    ./component/zsh.nix
    ./component/nixos.nix
    ./service/laptop.nix
    ./service/ntfs.nix
    ./service/audio.nix
    ./service/printing.nix
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

  # system wide packages
  environment.systemPackages = with pkgs; [

    # terminals
    alacritty

    # web browsers
    chromium
    firefox
    google-chrome

    # fonts
    jetbrains-mono

    # dotfile management
    #chezmoi
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

    # applications
    audacity      # sound engineering
    gimp          # image manipulation
    gnucash       # double entry accounting
    libreoffice   # office suite
    megasync      # cloud storage
    newsflash     # rss
    obsidian      # markdown editor
    spotify       # music service
    transmission-gtk
    vlc           # media player

  ];

}

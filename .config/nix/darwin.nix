{ config, pkgs, ... }:{

  environment = {
    darwinConfig = "$XDG_CONFIG_HOME/nix";
    systemPackages = with pkgs; [ 
      bat
      eza
      fastfetch
      fd
      fortune
      fzf
      git
      just
      lazygit
      neovim
      ripgrep
      sd
      starship
      tldr
      yadm
      yazi
      zoxide
      zsh
    ];
  };

  fonts.packages = with pkgs; [
    jetbrains-mono
    lexend
    nerdfonts
  ];

  homebrew.enable = true;
  homebrew.casks = [
    "aerospace"
    "balenaetcher"
    "firefox"
    "google-chrome"
    "keepingyouawake"
    "spotify"
    "transmission"
    "vlc"
    "wezterm"
  ];

  #home-manager = {};

  programs = {
    # Create /etc/zshrc that loads the nix-darwin environment.
    zsh.enable = true;
  };

  nix = {
    # Garbage Collection
    gc = {
      automatic = true;
      interval.Day = 7;
      options = "--delete-older-than 7d";
    };

    # Necessary for using flakes on this system.
    settings.experimental-features = "nix-command flakes";
  };

  services = {
    # Auto upgrade nix package and the daemon service.
    nix-daemon.enable = true;
  };

  system = {
    # Set Git commit hash for darwin-version.
    # configurationRevision = self.rev or self.dirtyRev or null;

    # Used for backwards compatibility, please read the changelog before changing.
    # $ darwin-rebuild changelog
    stateVersion = 4;
  };

}

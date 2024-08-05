{ config, pkgs, ... }:{
  environment.darwinConfig = "$XDG_CONFIG_HOME/nix";

  # List packages: nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [ 
    bat
    eza
    fastfetch
    fd
    fortune
    fzf
    git
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

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  # nix.package = pkgs.nix;

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  # Create /etc/zshrc that loads the nix-darwin environment.
  programs.zsh.enable = true;  # default shell on catalina
  # programs.fish.enable = true;

  # Set Git commit hash for darwin-version.
  # system.configurationRevision = self.rev or self.dirtyRev or null;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;

}

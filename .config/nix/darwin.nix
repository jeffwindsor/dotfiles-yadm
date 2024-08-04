{ config, pkgs, ... }:

{
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

  # Create /etc/zshrc that loads the nix-darwin environment.
  programs.zsh.enable = true;  # default shell on catalina

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}

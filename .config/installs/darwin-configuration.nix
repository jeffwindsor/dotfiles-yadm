{ config, pkgs, ... }:

{
  environment.darwinConfig = "$XDG_CONFIG_HOME/installs/darwin-configuration.nix";

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages =
    [ 
      pkgs.bat
      pkgs.eza
      pkgs.fastfetch
      pkgs.fd
      pkgs.fortune
      pkgs.fzf
      pkgs.git
      pkgs.lazygit
      pkgs.neovim
      pkgs.ripgrep
      pkgs.sd
      pkgs.starship
      pkgs.tldr
      pkgs.yadm
      pkgs.yazi
      pkgs.zoxide
      pkgs.zsh
    ];

  # Use a custom configuration.nix location.
  # $ darwin-rebuild switch -I darwin-config=$HOME/.config/nixpkgs/darwin/configuration.nix
  # environment.darwinConfig = "$HOME/.config/nixpkgs/darwin/configuration.nix";

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  # nix.package = pkgs.nix;

  # Create /etc/zshrc that loads the nix-darwin environment.
  programs.zsh.enable = true;  # default shell on catalina
  # programs.fish.enable = true;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}

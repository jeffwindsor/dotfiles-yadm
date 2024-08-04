{
  description = "NixOS, NixDarwin and Home Manager configuration";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    };
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
     inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager }:
  let
    configuration = { pkgs, ... }: {
      # List packages installed in system profile: nix-env -qaP | grep wget
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
        nerdfonts
      ];

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#midnight
    darwinConfigurations."Midnight-Air" = nix-darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      modules = [ 
        ./darwin.nix
      ];

    };

    # Expose the package set, including overlays, for convenience.
    # darwinPackages = self.darwinConfigurations."Midnight-Air".pkgs;
  };
}

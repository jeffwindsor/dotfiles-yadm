{
  description = "NixOS and Darwin flake - Jeff Windsor";

  inputs = { 

    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    };

    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { self, nixpkgs, nix-darwin, home-manager, ...}@inputs:
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#Midnight-Air
    darwinConfigurations."Midnight-Air" = nix-darwin.lib.darwinSystem {
      # The platform the configuration will be used on.
      system = "aarch64-darwin";
      modules = [ 
        ./darwin/
      ];
    };

    # Expose the package set, including overlays, for convenience.
    darwinPackages = self.darwinConfigurations."Midnight-Air".pkgs;
  };
}

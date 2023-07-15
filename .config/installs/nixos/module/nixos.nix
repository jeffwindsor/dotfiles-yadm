{ config, pkgs, ... }:{

  # package manager config
  nix = {
    # optimize space << https://nixos.wiki/wiki/Storage_optimization#Optimising_the_store
    settings.auto-optimise-store = true;

    # enable flakes << https://nixos.wiki/wiki/Storage_optimization#Automation
    settings.experimental-features = ["nix-command" "flakes"];

    # garbage collection on the regular << https://nixos.wiki/wiki/Storage_optimization#Automation
    gc = {
    automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
  };

  nixpkgs.config.allowUnfree = true;    # allow more packages

  system.autoUpgrade.enable = true;     # auto update nixos and nix packages

  # internationalization to be safe
  i18n ={
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "en_US.UTF-8";
      LC_IDENTIFICATION = "en_US.UTF-8";
      LC_MEASUREMENT = "en_US.UTF-8";
      LC_MONETARY = "en_US.UTF-8";
      LC_NAME = "en_US.UTF-8";
      LC_NUMERIC = "en_US.UTF-8";
      LC_PAPER = "en_US.UTF-8";
      LC_TELEPHONE = "en_US.UTF-8";
      LC_TIME = "en_US.UTF-8";
    };
  };

}

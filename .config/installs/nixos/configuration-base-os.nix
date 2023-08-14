##################################################################################
## BASE OS - CHROME OS++ LIKE EXPERIENCE
##################################################################################
{ config, pkgs, ... }:{

  imports = [
    ./gnome.nix
    ./hardware-configuration.nix
  ];

  # System Packages || https://search.nixos.org/packages
  environment.systemPackages = with pkgs; [
    freshfetch                  # neofetch replacement
    # tailscale                   # mesh VPN built on WireGuard
    # wireguard-tools             # secure network tunnel
  ];
  services.flatpak.enable = true;               # allow for user installed packages via flatpak

  # Audio Services || https://search.nixos.org/options
  services.pipewire = {
    enable = true;                            # https://pipewire.org/
    alsa.enable = true;                       # Advanced Linux Sound Architecture
    alsa.support32Bit = true;                 #     with 32 bit application support
    pulse.enable = true;                      # pulse audio emulation
  };
  hardware.pulseaudio.enable = false;         # turn off default pulse audio to use pipewire
  security.rtkit.enable = true;               # secure real-time scheduling for user processes (recommended)

  # Boot || https://search.nixos.org/options
  boot.loader = {
    systemd-boot.enable = true;               # EFI boot manager
    efi.canTouchEfiVariables = true;          # installation can modify EFI boot variables
  };

  # File Services || https://search.nixos.org/options
  boot.supportedFilesystems = [ "ntfs" ];     # NTFS for some of my USB Drives

  # Network Services || https://search.nixos.org/options
  networking.networkmanager.enable = true;    # Wifi Manager

  # Printing Services || https://search.nixos.org/options
  services.printing.enable = true;
  # Wifi / IPP capable printing << https://nixos.wiki/wiki/Printing#IPP_everywhere_capable_printer
  services.avahi = {
    enable = true;
    nssmdns = true;
    openFirewall = true;                      # for a WiFi printer
  };

  # Upgrades and Optimization || https://search.nixos.org/options
  system.autoUpgrade.enable = true;                     # auto upgrade nixos and nix packages
  nixpkgs.config.allowUnfree = true;                    # allow more packages
  nix.settings.auto-optimise-store = true;              # optimize links
  nix.gc = {
    automatic = true;                                   # garbage collection << https://nixos.wiki/wiki/Storage_optimization#Automation
    dates = "weekly";
    options = "--delete-older-than 7d";
  };
}

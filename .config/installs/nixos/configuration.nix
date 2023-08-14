##################################################################################
## FRAMEWORK 13 CONFIGURATION
##################################################################################
{ config, pkgs, ... }:{
  imports = [ ./configuration-development.nix ];

  # System Packages || https://search.nixos.org/packages
  environment.systemPackages = with pkgs; [
    fwupd                                       # firmware update service
    tlp                                         # laptop power mgmt service
  ];

  # NixOs Options || https://search.nixos.org/options
  networking.hostName = "frame";
  time.timeZone       = "America/Los_Angeles";
  system.stateVersion = "23.05";

  # Users
  users.users.mid = {
    isNormalUser  = true;
    description   = "The Middle Way";
    extraGroups   = [ "networkmanager" "wheel" ];
  };

}

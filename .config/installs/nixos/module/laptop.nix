{ config, pkgs, ... }:{

  # defaults
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  # helpful laptop packages
  environment.systemPackages = with pkgs; [
    fwupd   # firmware update service
    tlp     # laptop power mgmt service
 
  ];

  # wifi
  networking.networkmanager.enable = true;

}

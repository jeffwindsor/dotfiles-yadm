{ config, pkgs, ... }:{

  # printing services
  services.printing.enable = true;
  #   IPP capable printing << https://nixos.wiki/wiki/Printing#IPP_everywhere_capable_printer
  services.avahi = {
    enable = true;
    nssmdns = true;
    # for a WiFi printer
    openFirewall = true;
  };

}


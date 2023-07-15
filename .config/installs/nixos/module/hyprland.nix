{ config, pkgs, ... }:{

  environment.systemPackages = with pkgs; [
    hyprland
    wofi
    eww
  ];

  programs.hyprland.enable = true;
}

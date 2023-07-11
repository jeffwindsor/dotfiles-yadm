{ config, pkgs, ... }:{

  environment.systemPackages = with pkgs; [

    # shows old-school icons in tray (some programs need this, like mega sync)
    gnomeExtensions.appindicator

    # add some modern blurrrr to the de
    gnomeExtensions.blur-my-shell

    # stay awake
    gnomeExtensions.caffeine

    # taskbar quotes
    gnomeExtensions.executor
    fortune

    # tiling window manager
    gnomeExtensions.forge

    # tweaks to gnome visuals
    gnomeExtensions.just-perfection

    # weather in the taskbar
    gnomeExtensions.openweather

    # display of workspaces (like i3)
    gnomeExtensions.space-bar

    # display system informatio in the taskbar
    #gnomeExtensions.system-monitor

    # auto switch wallpapers
    gnomeExtensions.wallpaper-switcher

    # improved extension manager
    gnome-extension-manager

    # firmware application
    gnome-firmware

    # terminal to clipboard manager
    xclip
  ];

  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
    layout = "us";
    xkbVariant = "";
  };
}

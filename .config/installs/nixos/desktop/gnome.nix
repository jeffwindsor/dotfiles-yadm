{ config, pkgs, ... }:{

  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
    layout = "us";
    xkbVariant = "";
  };

  environment.systemPackages = with pkgs; [
    fortune
    gnome-extension-manager           # improved extension manager
    gnome-firmware                    # firmware application
    gnomeExtensions.appindicator      # shows old-school icons in tray (some programs need this, like mega sync)
    gnomeExtensions.blur-my-shell     # add some modern blurrrr to the de
    gnomeExtensions.caffeine          # stay awake
    gnomeExtensions.executor          # taskbar quotes
    gnomeExtensions.forge             # tiling window manager
    gnomeExtensions.just-perfection   # tweaks to gnome visuals
    gnomeExtensions.openweather       # weather in the taskbar
    gnomeExtensions.space-bar         # display of workspaces (like i3)
    #gnomeExtensions.system-monitor    # display system informatio in the taskbar
    gnomeExtensions.wallpaper-switcher # auto switch wallpapers
    xclip                             # terminal to clipboard manager
  ];

  # uneeded applications with the normal gnome
  environment.gnome.excludePackages = (with pkgs; [
    gnome-photos
    gnome-tour
    gnome.cheese      # webcam tool
    gnome.gnome-music
    gnome.epiphany    # web browser
    gnome.geary       # email reader
    gnome.tali        # poker game
    gnome.iagno       # go game
    gnome.hitori      # sudoku game
    gnome.atomix      # puzzle game
    gnome.yelp        # Help view
    gnome.gnome-contacts
    gnome.gnome-initial-setup
  ]);

}

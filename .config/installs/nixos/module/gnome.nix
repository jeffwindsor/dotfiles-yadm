{ config, pkgs, ... }:{

  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
    layout = "us";
    xkbVariant = "";
  };

  # uneeded applications with the normal gnome
  environment.gnome.excludePackages = (with pkgs; [
    gnome-photos
    gnome-tour
    gnome.atomix                      # puzzle game
    gnome.cheese                      # webcam tool
    gnome.epiphany                    # web browser
    gnome.geary                       # email reader
    gnome.gnome-contacts
    gnome.gnome-initial-setup
    gnome.gnome-maps
    gnome.gnome-music
    gnome.gnome-shell-extensions      # orginal extension manager
    gnome.hitori                      # sudoku game
    gnome.iagno                       # go game
    gnome.tali                        # poker game
    gnome.totem                       # gnome videos
    gnome.yelp                        # Help view
  ]);

  # system packages
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
    gnomeExtensions.launch-new-instance
    gnomeExtensions.openweather       # weather in the taskbar
    gnomeExtensions.space-bar         # display of workspaces (like i3)
    gnomeExtensions.wallpaper-switcher # auto switch wallpapers
    xclip                             # terminal to clipboard manager
  ];

}

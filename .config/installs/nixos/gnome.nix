{ config, pkgs, ... }:{

  # ===============================================================================================
  # Enable GDM and GNOME DESKTOP
  # ===============================================================================================
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
    layout = "us";
    xkbVariant = "";
  };

  # ===============================================================================================
  #  Exclude Packages (From Default Gnome Packages)
  # ===============================================================================================
  environment.gnome.excludePackages = (with pkgs; [
    gnome-photos                      # default photo app
    gnome-tour                        # gnome first install tour
    xterm                             # good terminal, just not what I like

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

  # ===============================================================================================
  #  Add Packages (To Personalize Gnome)
  # ===============================================================================================
  environment.systemPackages = (with pkgs; [
    gnome-extension-manager             # improved extension manager
    gnome-firmware                      # firmware application
    xclip

    gnome.gnome-terminal                # simple backup terminal
    gnome.seahorse                      # manage encryption keys and passwords in the GnomeKeyring

    gnomeExtensions.auto-move-windows   # allow the forever assignment of application to a specific desktop
    gnomeExtensions.appindicator        # shows old-school icons in tray (some programs need this, like mega sync)
    gnomeExtensions.blur-my-shell       # add some modern blurrrr to the de
    gnomeExtensions.caffeine            # stay awake
    gnomeExtensions.clipman             # clipboard manager for taskbar
    gnomeExtensions.executor            # command output to taskbar: very powerful but I only use it for fortune quotes
    gnomeExtensions.forge               # tiling window manager
    gnomeExtensions.just-perfection     # tweaks to gnome visuals
    gnomeExtensions.launch-new-instance # when launching apps create a new instance, helps with closing only current window not all windows
    gnomeExtensions.openweather         # weather in the taskbar
    gnomeExtensions.space-bar           # display of workspace indicators (like i3)
    gnomeExtensions.wallpaper-switcher  # auto switch wallpapers
    gnomeExtensions.pano                # Next-gen Clipboard manager for Gnome Shell

  ]);

}

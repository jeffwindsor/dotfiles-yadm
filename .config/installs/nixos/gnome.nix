{ config, pkgs, ... }:{

  # ===============================================================================================
  # Enable GDM and GNOME
  # ===============================================================================================
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
    layout = "us";
    xkbVariant = "";
  };

  # ===============================================================================================
  #  Additions
  # ===============================================================================================
  # add the games pack
  services.gnome.games.enable = true;

  # preferred packages
  environment.systemPackages = (with pkgs; [
    gnome-extension-manager             # improved extension manager
    gnome-firmware                      # firmware application
    xclip                               # manages terminal to clipboard copies
    gnome.gnome-terminal                # simple backup terminal
    gnome.seahorse                      # manage encryption keys and passwords in the GnomeKeyring
  ]};

  # preferred gnome extensions
  environment.systemPackages = (with pkgs.gnomeExtensions; [
    auto-move-windows                   # allow the forever assignment of application to a specific desktop
    appindicator                        # shows old-school icons in tray (some programs need this, like mega sync)
    blur-my-shell                       # add some modern blurrrr to the de
    caffeine                            # stay awake
    clipman                             # clipboard manager for taskbar
    executor                            # command output to taskbar: very powerful but I only use it for fortune quotes
    forge                               # tiling window manager
    just-perfection                     # tweaks to gnome visuals
    launch-new-instance                 # when launching apps create a new instance, helps with closing only current window not all windows
    openweather                         # weather in the taskbar
    space-bar                           # display of workspace indicators (like i3)
    wallpaper-switcher                  # auto switch wallpapers
    pano                                # Next-gen Clipboard manager for Gnome Shell
  ]);

  # ===============================================================================================
  #  Exclusions
  # ===============================================================================================
  environment.gnome.excludePackages = (with pkgs; [
    # gnome-photos                      # default photo app
    gnome-tour                        # gnome first install tour
    gnome.cheese                      # webcam tool
    gnome.epiphany                    # web browser
    # gnome.geary                       # email reader
    # gnome.gnome-contacts
    gnome.gnome-initial-setup
    gnome.gnome-maps
    gnome.gnome-music
    gnome.totem                       # gnome videos
    gnome.yelp                        # Help view
  ]);

  # remove xterm, good terminal, just not what I like
  services.xserver.desktopManager.xterm.enable = false    # required to remove xterm
  environment.gnome.excludePackages = [ pkgs.xterm ];

}

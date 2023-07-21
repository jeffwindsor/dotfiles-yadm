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
    gnome-photos                # default photo app
    gnome-tour                  # gnome first install tour
    xterm                       # good terminal, just not what I like

  # == Gnome Namespace ===================================================================
  ]) ++ (with pkgs.gnome; [
    atomix                      # puzzle game
    cheese                      # webcam tool
    epiphany                    # web browser
    geary                       # email reader
    gnome-contacts
    gnome-initial-setup
    gnome-maps
    gnome-music
    gnome-shell-extensions      # orginal extension manager
    hitori                      # sudoku game
    iagno                       # go game
    tali                        # poker game
    totem                       # gnome videos
    yelp                        # Help view

  ]);

  # ===============================================================================================
  #  Add Packages (To Personalize Gnome)
  # ===============================================================================================
  environment.systemPackages = (with pkgs; [
    gnome-extension-manager     # improved extension manager
    gnome-firmware              # firmware application

  # == Gnome Namespace ===================================================================
  ]) ++ (with pkgs.gnome; [
    gnome-terminal              # simple backup terminal
    seahorse                    # manage encryption keys and passwords in the GnomeKeyring

  # == Gnome Extensions Namepspace ========================================================
  ]) ++ (with pkgs.gnomeExtensions; [
    auto-move-windows           # allow the forever assignment of application to a specific desktop
    appindicator                # shows old-school icons in tray (some programs need this, like mega sync)
    blur-my-shell               # add some modern blurrrr to the de
    caffeine                    # stay awake
    clipman                     # clipboard manager for taskbar
    executor                    # command output to taskbar: very powerful but I only use it for fortune quotes
    forge                       # tiling window manager
    just-perfection             # tweaks to gnome visuals
    launch-new-instance         # when launching apps create a new instance, helps with closing only current window not all windows
    openweather                 # weather in the taskbar
    space-bar                   # display of workspace indicators (like i3)
    wallpaper-switcher          # auto switch wallpapers

  ]);

}

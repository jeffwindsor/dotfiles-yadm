{ config, pkgs, ... }:{

  # enable gdm and gnome
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
    layout = "us";
    xkbVariant = "";
  };

  # == System Packages added by gnome enable I do not want ========================================
  environment.gnome.excludePackages = (with pkgs; [
    gnome-photos                # default photo app
    gnome-tour                  # gnome first install tour
    xterm                       # good terminal, just not what I like

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

  # == System Packages I want as part of the gnome enable ========================================
  environment.systemPackages = (with pkgs; [
    gnome-extension-manager     # improved extension manager
    gnome-firmware              # firmware application

  # == System Packages - Gnome ===================================================================
  ]) ++ (with pkgs.gnome; [
    gnome-terminal              # simple backup terminal

  # == System Packages - Gnome Extensions ========================================================
  ]) ++ (with pkgs.gnomeExtensions; [
    auto-move-windows
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

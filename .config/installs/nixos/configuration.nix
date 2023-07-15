{ config, pkgs, ... }:{

  imports = [
    ./module/gnome.nix
    ./module/zsh.nix
    ./hardware-configuration.nix
  ];

  # == System =====================================================================================
  networking.hostName = "frame";
  time.timeZone       = "America/Los_Angeles";
  system.stateVersion = "23.05";

  # == Users ======================================================================================
  users.users.mid = {
    isNormalUser  = true;
    description   = "The Middle Way";
    extraGroups   = [ "networkmanager" "wheel" ];
  };

  # == System Packages ===========================================================================
  services.flatpak.enable = true;       # enable flatpaks
  environment.systemPackages = with pkgs; [
    alacritty       # terminals
    bat             # cat
    exa             # ls
    fd              # find
    freshfetch      # neofetch replacement
    fwupd           # firmware update service
    fzf             # fuzzy finder
    gcc             # c compiler
    git             # source control
    gitui           # source control tui
    helix           # editors
    jetbrains-mono  # fonts
    neovim          # editors
    ripgrep         # grep
    sd              # sed
    starship        # prompt
    tealdeer        # tldr
    tlp             # laptop power mgmt service
    xplr            # tui file explorer
    yadm            # dotfile management
    zellij          # tmux

  ];

  # ==
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  # == Audio Services =============================================================================
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  hardware.pulseaudio.enable = false;

  # == File Services ==============================================================================
  boot.supportedFilesystems = [ "ntfs" ];     # NTFS for some of my USB Drives

  # == Network Services ===========================================================================
  networking.networkmanager.enable = true;    # Wifi manager

  # == Printing Services ===========================================================================
  services.printing.enable = true;
  services.avahi = {
    # IPP capable printing << https://nixos.wiki/wiki/Printing#IPP_everywhere_capable_printer
    enable = true;
    nssmdns = true;
    # for a WiFi printer
    openFirewall = true;
  };

  # == Upgrades and Optimization ===================================================================
  system.autoUpgrade.enable = true;                     # auto upgrade nixos and nix packages
  nixpkgs.config.allowUnfree = true;                    # allow more packages
  nix.settings.auto-optimise-store = true;              # optimize links
  nix.gc = {
    automatic = true;                                 # https://nixos.wiki/wiki/Storage_optimization#Automation
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  # == Experimentals ===============================================================================
  nix.settings.experimental-features = ["nix-command" "flakes"]; # allow flakes

}

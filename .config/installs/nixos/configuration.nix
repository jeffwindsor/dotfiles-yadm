{ config, pkgs, ... }:{

  imports = [
    ./module/gnome.nix
    ./module/zsh.nix
    ./hardware-configuration.nix
  ];
https://search.nixos.org/options?channel=23.05&from=0&size=1000&sort=alpha_asc&type=packages&query=services.
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
  services.flatpak.enable = true;
  environment.systemPackages = with pkgs; [
    alacritty       # terminal improvement
    fwupd           # firmware update service
    gcc             # c compiler
    tlp             # laptop power mgmt service
    xclip           # terminal to clipboard manager (used by terminal and clipboard)

    fortune         # saying that make my day
    git             # source control
    gitui           # source control tui
    helix           # editor (kakoune like)
    jetbrains-mono  # fonts
    neovim          # editor (vim like)
    yadm            # dotfile management

  ];

  # ==
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  # == Audio Services =============================================================================
  services.pipewire = {
    enable = true;                            # https://pipewire.org/
    alsa.enable = true;                       # Advanced Linux Sound Architecture
    alsa.support32Bit = true;                 #     with 32 bit application support
    pulse.enable = true;                      # pulse audio emulation
  };
  hardware.pulseaudio.enable = false;         # turn off default pulse audio to use pipewire
  security.rtkit.enable = true;               # secure real-time scheduling for user processes (recommended)

  # == File Services ==============================================================================
  boot.supportedFilesystems = [ "ntfs" ];     # NTFS for some of my USB Drives

  # == Network Services ===========================================================================
  networking.networkmanager.enable = true;    # Wifi Manager

  # == Printing Services ===========================================================================
  services.printing.enable = true;
  # Wifi / IPP capable printing << https://nixos.wiki/wiki/Printing#IPP_everywhere_capable_printer
  services.avahi = {
    enable = true;
    nssmdns = true;
    openFirewall = true;                      # for a WiFi printer
  };

  # == Upgrades and Optimization ===================================================================
  system.autoUpgrade.enable = true;                     # auto upgrade nixos and nix packages
  nixpkgs.config.allowUnfree = true;                    # allow more packages
  nix.settings.auto-optimise-store = true;              # optimize links
  nix.gc = {
    automatic = true;                                   # garbage collection << https://nixos.wiki/wiki/Storage_optimization#Automation
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  # == Experimentals ===============================================================================
  nix.settings.experimental-features = ["nix-command" "flakes"]; # allow flakes

}

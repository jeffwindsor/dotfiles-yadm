{ config, pkgs, ... }:{
  # NixOs Options | https://search.nixos.org/options
  # Packages      | https://search.nixos.org/packages

  imports = [
    ./gnome.nix
    ./hardware-configuration.nix
  ];

  networking.hostName = "frame";
  time.timeZone       = "America/Los_Angeles";
  system.stateVersion = "23.05";

  users.users.mid = {
    isNormalUser  = true;
    description   = "The Middle Way";
    extraGroups   = [ "networkmanager" "wheel" ];
    shell         = pkgs.zsh;
    packages      = with pkgs; [];
  };

  environment.systemPackages = with pkgs; [
    # applications
    alacritty                                 # terminal improvement
    brave                                     # experimental: browser
    chromium                                  # browser backup
    firefox                                   # browser main
    helix                                     # experimental: editor (kakoune like)
    librewolf                                 # experimental: browser
    megasync                                  # cloud storage
    neovim                                    # editor (vim like)

    # tools
    bat                                       # cat replacement
    exa                                       # ls replacement
    fd                                        # experimental: find replacement
    fortune                                   # saying that make my day
    freshfetch                                # experimental: neofetch replacement
    fzf                                       # fuzzy finder
    gcc                                       # c compiler
    git                                       # source control
    lazygit                                   # experimental: tui git client
    ripgrep                                   # grep replacement
    sd                                        # experimental: sed replacement
    starship                                  # prompt
    tealdeer                                  # tldr replacement
    xh                                        # experimental: curl replacement
    xplr                                      # experimental: tui file explorer
    yadm                                      # dotfile management
    zellij                                    # experimental: tmux replacement

    # shells
    nushell                                   # experimental: modern shell written in Rust
    zsh                                       # main shell
    zsh-autosuggestions
    zsh-syntax-highlighting

    # fonts
    jetbrains-mono                            # main font
    lexend
    nerdfonts

    # printers
    cups-brother-hll2350dw                    # home and office printer (2023)

    # services
    fwupd                                     # firmware update service
    tlp                                       # laptop power mgmt service
  ];
  services.flatpak.enable = true;             # allow for user installed packages via flatpak


  # Audio Services ===========================
  services.pipewire = {
    enable = true;                            # https://pipewire.org/
    alsa.enable = true;                       # Advanced Linux Sound Architecture
    alsa.support32Bit = true;                 #     with 32 bit application support
    pulse.enable = true;                      # pulse audio emulation
  };
  hardware.pulseaudio.enable = false;         # turn off default pulse audio to use pipewire
  security.rtkit.enable = true;               # secure real-time scheduling for user processes (recommended)


  # Boot =====================================
  boot.loader = {
    systemd-boot.enable = true;               # EFI boot manager
    efi.canTouchEfiVariables = true;          # installation can modify EFI boot variables
  };


  # Experimentals ============================
  # nix.settings.experimental-features = [ "nix-command" "flakes" ];


  # File Services ============================
  boot.supportedFilesystems = [ "ntfs" ];     # NTFS for some of my USB Drives


  # Network Services =========================
  networking.networkmanager.enable = true;    # Wifi Manager


  # Printing Services ========================
  services.printing = {
    enable = true;
    drivers = [ pkgs.cups-brother-hll2350dw ];
  };
  services.avahi = {
    enable = true;
    nssmdns = true;
    openFirewall = true;                      # Wifi printing
  };


  # Upgrades and Optimization ================
  system.autoUpgrade.enable = true;           # auto upgrade nixos and nix packages
  nixpkgs.config.allowUnfree = true;          # allow more packages
  nix.settings.auto-optimise-store = true;    # optimize links
  nix.gc = {
    automatic = true;                         # garbage collection << https://nixos.wiki/wiki/Storage_optimization#Automation
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  # ZSH =====================================
  programs.zsh = {
    enable = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
  };
  environment.shells = with pkgs; [ zsh ];

}

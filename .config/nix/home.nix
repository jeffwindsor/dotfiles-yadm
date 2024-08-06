{ pkgs,  ... }: {

  # applications with configuration 
  imports = [ 
    ./home/eza.nix
  ];

  # applications that may need configuration
  # programs = {
    # nushell.enable  = true;
  # };

  # home.shellAliases = {
  #   # nixos
  #   "nixos"    = "cd $LOC_NIXOS";
  #   "system"   = "cd $LOC_NIXOS && hx .";
  #   "clean"    = "nix-env --delete-generations +10 && nix-collect-garbage && nix store optimise && flatpak uninstall --unused -y";
  #   "list"     = "sudo nix-env --list-generations --profile /nix/var/nix/profiles/system";
  #   "rebuild"  = "sudo nixos-rebuild switch";
  #   "upgrade"  = "sudo nix-channel --update";
  #   "shell"    = "nix-shell";
  # };
    
  # home.sessionVariables = {
  #   LOC_JEFF    = "$HOME/Source/github.com/jeffwindsor";
  #   LOC_NIXOS   = "$HOME/Source/github.com/jeffwindsor/nixos-config";
  #   LOC_NIX     = "$XDG_CONFIG_HOME/nix";
  #   LOC_SRC     = "$HOME/Source";
  # };
  programs.home-manager.enable = true;

  home.stateVersion  = "24.05";
}

{ ... }: {
 
  programs.eza = {
    enable = true;
    extraOptions = [ "--group-directories-first" ];
  };

  home.shellAliases = {
    l = "eza -F";
    la = "eza -F --git --all";
    ll = "eza -lF";
    lla = "eza -lF --git --all";
    tree = "eza --tree --git";
    treea = "eza --tree --git --all";
    treed = "eza --tree --git --level";
  };

}

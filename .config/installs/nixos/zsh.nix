{ config, pkgs, ... }:{

  # ZSH =====================================
  programs.zsh = {
    enable = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
  };
  environment.shells = with pkgs; [ zsh ];
  users.defaultUserShell = pkgs.zsh;

  # Packages =================================
  environment.systemPackages = with pkgs; [
    bat                                       # cat replacement
    exa                                       # ls replacement
    zsh
    zsh-autosuggestions
    zsh-syntax-highlighting

  ];

}

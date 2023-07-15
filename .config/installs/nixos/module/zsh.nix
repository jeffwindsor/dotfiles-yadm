{ config, pkgs, ... }:{

  environment = {
    shells = with pkgs; [ zsh ];
    systemPackages = with pkgs; [
      zsh
      zsh-autosuggestions
      zsh-syntax-highlighting
    ];
  };

  programs.zsh = {
    enable = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
  };

  users.defaultUserShell = pkgs.zsh;

}

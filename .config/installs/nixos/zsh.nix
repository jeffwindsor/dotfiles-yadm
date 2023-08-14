{ config, pkgs, ... }:{

  # System Packages
  environment.systemPackages = with pkgs; [
    zsh
    zsh-autosuggestions
    zsh-syntax-highlighting
  ];

  # enable zsh shell and layers
  programs.zsh = {
    enable = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
  };

  # add zsh to available shells
  environment.shells = with pkgs; [ zsh ];

  # set zsh as users default shell
  users.defaultUserShell = pkgs.zsh;

}

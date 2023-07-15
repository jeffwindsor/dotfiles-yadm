{ config, pkgs, ... }:{

  # == System Packages ===========================================================================
  environment.systemPackages = with pkgs; [
    zsh
    zsh-autosuggestions
    zsh-syntax-highlighting

    bat             # cat replacement
    exa             # ls replacement
    fd              # find replacement
    freshfetch      # neofetch replacement
    fzf             # fuzzy finder
    ripgrep         # grep replacement
    sd              # sed replacement
    starship        # prompt
    tealdeer        # tldr replacement
    xplr            # tui file explorer
    zellij          # tmux replacement

  ];

  # == Shell ======================================================================================
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

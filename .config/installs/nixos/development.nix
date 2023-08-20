{ config, pkgs, ... }:{

  imports = [
    ./zsh.nix
  ];

  # == System Packages ===========================================================================
  environment.systemPackages = with pkgs; [

    # applications
    alacritty       # terminal improvement

    # languages / compilers
    gcc             # c compiler

    # source control
    git             # source control
    lazygit         # tui git client

    # editors
    helix           # editor (kakoune like)
    neovim          # editor (vim like)

    # containers
    devbox          # instant, easy, predictable shells and containers.
    distrobox       # wrapper for podman that links home to containers for easy test and dev envs
    podman          # container (non-root) service

    # command line tools
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

    # fonts
    jetbrains-mono
    fira-code

  ];
}

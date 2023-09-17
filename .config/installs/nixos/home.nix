{ config, pkgs, ... }:{

# home manager config
  home = {
    username = "mid";
    homeDirectory = "/home/mid";
    packages = with pkgs; [];
    stateVersion = "23.05";
  };

# program configuration / dotfiles
  programs = {

    alacritty = {
      enable = true;
      settings = {
	window = {
	  padding = {
	      x = 10;
	      y = 10;};
	  opacity = 0.98;
	  decorations = "none"; };
	cursor.style = "Block";
	font = {
	  normal.family = "JetBrainsMono Nerd Font";
	  size = 12; };
	# Colors (Tender)
	colors = {
	  # Default colors
	  primary = {
	    background = "#282828";
	    foreground = "#eeeeee"; };
	  # Normal colors
	  normal = {
	    black =   "#282828";
	    red =     "#f43753";
	    green =   "#c9d05c";
	    yellow =  "#ffc24b";
	    blue =    "#b3deef";
	    magenta = "#d3b987";
	    cyan =    "#73cef4";
	    white =   "#eeeeee"; };

	  # Bright colors
	  bright = {
	    black =   "#4c4c4c";
	    red =     "#f43753";
	    green =   "#c9d05c";
	    yellow =  "#ffc24b";
	    blue =    "#b3deef";
	    magenta = "#d3b987";
	    cyan =    "#73cef4";
	    white =   "#feffff"; };
	};
      };
    };

    bat = {
      enable = true;
      config.theme = "Nord"; };

    git = {
      enable = true;
      extraConfig = {
        core.excludesFile = "~/.config/git/ignore";
        pull.ff = "only";
        init.defaultBranch = "main";
        credential.helper = "cache";
        url = {
          "git@github.com:" = {
	    insteadOf = "https://github.com/"; };
        };
      };
      ignores = [
        ".git"
      ];
      userName = "Jeff Windsor";
      userEmail = "jeff.windsor@gmail.com"; };

    fzf = {
      enable = true;
      enableZshIntegration = true; };

    #ripgrep = {
    #  enable = true;
    #  arguments = [
      #  "--max-columns=120"
      #  "--max-columns-preview"
      #  "--smart-case"
      #  "--hidden"
      #  "--glob=!.git/*" 
      #];
    #};

    starship = {
      enable = true;
      enableBashIntegration = true;
      # enableNushellIntegration = true;
      enableZshIntegration = true;
      settings = {
        format = "[┌ ](blue)$directory$git_branch$git_status$jobs$nix_shell$container\n[└ ](blue)$shell$time$cmd_duration$character";

        character = {
          error_symbol   = "[:](red)";
          success_symbol = "[:](green)";
          vicmd_symbol   = "[>](yellow)"; };

        directory = {
          fish_style_pwd_dir_length = 1;
          style = "blue"; };

        git_branch = {
          style = "cyan";
          symbol = ""; };

        git_status = {
          format = "([\[](dimmed yellow)[$all_status$ahead_behind](yellow)[\]](dimmed yellow)) "; };

        jobs = {
          disabled=false;
          format="([\[](dimmed blue)[$number](dimmed blue)[\]](dimmed blue))";
          number_threshold=1; };

        nix_shell = {
          disabled=false;
          style = "cyan"; };

        shell = {
          disabled = false;
          style = "dimmed blue";
          bash_indicator = "💣";
          fish_indicator = "🐟";
          zsh_indicator = "🧟"; };

        time = {
          disabled=false;
          format = "[$time](blue) "; };
      };
    };

    tealdeer = {
      enable = true;
      settings = {
        display = {
          compact = false;
          use_pager = true; };
        updates = {
          auto_update = false; };
      };
    };

    zsh = {
      autocd = true;
      defaultKeymap = "viins";
      enable = true;
      enableCompletion = true;
      enableAutosuggestions = true;
      enableSyntaxHighlighting = true;
      history = {
        expireDuplicatesFirst = true;
        ignorePatterns = [ "rm *" "pkill *" ]; };

      sessionVariables = {
        XDG_STATE_HOME  = "$HOME/.local/state";
        XDG_DATA_HOME   = "$HOME/.local/share";
        XDG_CACHE_HOME  = "$HOME/.cache";
        XDG_CONFIG_HOME = "$HOME/.config";
        EDITOR          = "$(which nvim)";
        SRC             = "$HOME/Source";
        DOTFILES        = "$HOME/.config/";
        INSTALLS        = "$HOME/.config/installs";
        GIT_LOG_PRETTY_FORMAT = "%C(green)%h%C(auto)%d%C(reset) - %s | %C(cyan)%an %C(dim)%cr%C(reset)";
        RIPGREP_CONFIG_PATH   = "$XDG_CONFIG_HOME/ripgrep/ripgreprc"; };

      shellAliases = {
        # directories
        "...."      = "cd ../../../";
        "..."       = "cd ../../";
        ".."        = "cd ..";
        "dot"       = "cd $HOME/.config";
        "in"        = "cd $HOME/.config/installs";
        "src"       = "cd $HOME/Source";
        "hub"       = "cd $HOME/Source/github.com";
        "jeff"      = "cd $HOME/Source/github.com/jeffwindsor";
        "business"  = "cd $HOME/Source/github.com/jeffwindsor/financials/gnucash/business/imports";
        "home"      = "cd $HOME/Source/github.com/jeffwindsor/financials/gnucash/home/imports";
        "md"        = "cd $HOME/portable/exocortex/markdown";
        # nvim
        "v"         = "nvim";
        # bat / cat
        "cat"       = "bat --style=plain";
        # exa / ls
        "l"         = "exa -F --group-directories-first";
        "la"        = "exa -F --group-directories-first --git --all";
        "ll"        = "exa -lF --group-directories-first";
        "lla"       = "exa -lF --group-directories-first --git --all";
        "tree"      = "exa --tree --git";
        "treea"     = "exa -lF --tree --git --all";
        # grep / ripgrep
        "grep"      = "rg";
        "ar"        = "alias | rg";
        # freshfetch
        "f"         = "freshfetch";
        # git
        "gui"       = "lazygit";
        "ga"        = "git add";
        "gaa"       = "git add --all";
        "gb"        = "git branch -v";
        "gc"        = "git clone";
        "gcm"       = "git commit -m";
        "gco"       = "git checkout";
        "gd"        = "git diff --ignore-space-at-eol -b -w --ignore-blank-lines";
        "gl"        = "git log";
        #"gll"       = "git log --graph --pretty=format:\"${GIT_LOG_PRETTY_FORMAT}\" --abbrev-commit";
        "gph"       = "git push";
        "gpl"       = "git pull";
        "gr"        = "git remote -vv";
        "gs"        = "git status -sb --ignore-submodules";
        "gup"       = "git add --all && git commit -m";
        # helix
        "h"         = "helix";
        # nixos
        "change"    = "nvim -c \":args $XDG_CONFIG_HOME/installs/nixos/*.nix\"";
        "clean"     = "nix-env --delete-generations +7 && nix-collect-garbage";
        "list"      = "sudo nix-env --list-generations --profile /nix/var/nix/profiles/system";
        "optimize"  = "nix store optimise";
        "rebuild"   = "sudo cp -r \$HOME/.config/installs/nixos/*.nix /etc/nixos/ && sudo nixos-rebuild switch";
        "shell"     = "nix-shell --command zsh";
        "up"        = "sudo nixos-rebuild switch --upgrade"; };
    };
  };
}

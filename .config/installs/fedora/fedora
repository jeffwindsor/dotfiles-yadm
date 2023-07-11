#!/usr/bin/env bash
cd "$(dirname "${0}")" || exit

menu(){
clear
echo -ne "
 \e[38;5;39m
███████╗███████╗██████╗  ██████╗ ██████╗  █████╗
██╔════╝██╔════╝██╔══██╗██╔═══██╗██╔══██╗██╔══██╗
█████╗  █████╗  ██║  ██║██║   ██║██████╔╝███████║
██╔══╝  ██╔══╝  ██║  ██║██║   ██║██╔══██╗██╔══██║
██║     ███████╗██████╔╝╚██████╔╝██║  ██║██║  ██║
╚═╝     ╚══════╝╚═════╝  ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝
\e[0m
0)  All
u)  User Software
ge) Gnome Extensions

Select Step:  "
  read -r step
  case $step in
    0) user_software
       gnome_extensions
       ;;
    u) user_software ;;
    e) gnome_extensions ;;
    *)
      echo "Not a valid option"
      exit 1
      ;;
  esac
}

###############################################################################
# make current
###############################################################################
install_gnome_extension(){
  # Need current GNOME shell version
  shell_version=$(gnome-shell --version | cut -d' ' -f3)

  # Fetch extension info (for the given shell version) example input: 307
  info_json=$(curl -sS "https://extensions.gnome.org/extension-info/?pk=$1&shell_version=$shell_version")

  # Extract download url from the json with jq
  download_url=$(echo $info_json | jq ".download_url" --raw-output)

  # Install the extension via the dev tool
  echo "==> installing gnome $shell_version extension $1 from $download_url"
  gnome-extensions install "https://extensions.gnome.org$download_url"
}

user_software(){
  ###############################################################################
  # dnf
  ###############################################################################
  #echo "max_parallel_downloads=20" | sudo tee -a /etc/dnf/dnf.conf
  #echo "defaultyes=True" | sudo tee -a /etc/dnf/dnf.conf
  #echo "fastestmirror=False" | sudo tee -a /etc/dnf/dnf.conf
  #echo "cacheonly=True" | sudo tee -a /etc/dnf/dnf.conf
  # add rpm fusion repositories
  #sudo dnf -y install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-"$(rpm -E %fedora)".noarch.rpm
  #sudo dnf -y install https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-"$(rpm -E %fedora)".noarch.rpm

  # upgrade all packages to most current
  sudo dnf -y upgrade

  # remove unwanted software
  sudo dnf -y remove firefox

  # install user software
  sudo dnf -y install alacritty
  sudo dnf -y install zsh zsh-autosuggestions zsh-syntax-highlighting
  sudo dnf -y install jetbrains-mono-fonts
  sudo dnf -y install bat
  sudo dnf -y install exa
  sudo dnf -y install entr
  sudo dnf -y install fd-find
  sudo dnf -y install fortune-mod
  sudo dnf -y install fzf
  sudo dnf -y install ranger
  sudo dnf -y install ripgrep
  sudo dnf -y install sd
  sudo dnf -y install shellcheck
  sudo dnf -y install tealdeer
  sudo dnf -y install vifm
  sudo dnf -y install dust
  sudo dnf -y install bottom
  sudo dnf -y install broot
  sudo dnf -y install fclones
  sudo dnf -y install zellij
  sudo dnf -y install ncspot
  sudo dnf -y install rtx

  # neovim
  sudo dnf -y install gcc "gcc-c++" glibc-all-langpacks neovim && git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
  # starship prompt
  sudo dnf -y copr enable atim/starship && sudo dnf -y install starship

  # flatpak install -y "io.github.endless_sky.endless_sky"
  # flatpak install -y "net.sourceforge.Klavaro"                    # typing
  # flatpak install -y "org.videolan.VLC"
  flatpak install -y "com.discordapp.Discord"
  flatpak install -y "com.github.rafostar.Clapper"
  flatpak install -y "com.github.tchx84.Flatseal"                 # flatpak sec manager
  flatpak install -y "com.gitlab.davem.ClamTk"                    # virus
  flatpak install -y "com.gitlab.newsflash"
  flatpak install -y "com.google.Chrome"
  flatpak install -y "com.mattjakeman.ExtensionManager"           # improved extension manager
  flatpak install -y "com.spotify.Client"
  flatpak install -y "com.valvesoftware.Steam"
  flatpak install -y "io.gitlab.librewolf-community"
  flatpak install -y "io.podman_desktop.PodmanDesktop"
  flatpak install -y "md.obsidian.Obsidian"
  flatpak install -y "org.chromium.Chromium"
  flatpak install -y "org.gnome.Evolution"
  flatpak install -y "org.gnome.Firmware"
  flatpak install -y "org.gnome.Photos"
  flatpak install -y "org.gnome.Podcasts"
  flatpak install -y "org.gnome.seahorse.Application"
  flatpak install -y "org.gnucash.GnuCash"
  flatpak install -y "org.zealdocs.Zeal"                          # dev docs
}

gnome_extensions(){
  # gnome extesions
  # 615  | AppIndicator, https://github.com/ubuntu/gnome-shell-extension-appindicator, _
  install_gnome_extension 615
  # 3193 | Blur My Shell, https://github.com/aunetx/gnome-shell-extension-blur-my-shell, src
  install_gnome_extension 3193
  # 517  | Caffeine, https://github.com/eonpatapon/gnome-shell-extension-caffeine, caffeine@patapon.info
  install_gnome_extension 517
  # 2932 | Executor, https://github.com/raujonas/executor, executor@raujonas.github.io
  install_gnome_extension 2932
  # 4481 | Forge, https://github.com/jmmaranan/forge, _
  install_gnome_extension 4481
  # 3843 | Just Perfection, https://gitlab.gnome.org/jrahmatzadeh/just-perfection, src
  install_gnome_extension 3843
  # 5090 | Space Bar, https://github.com/christopher-l/space-bar, _
  install_gnome_extension 5090
  # 4812 | Wallpaper Switcher, https://github.com/rishuinfinity/WallpaperSwitcher, src
  install_gnome_extension 4812
  #   # 5470 | Weather O'Clock, https://github.com/CleoMenezesJr/weather-oclock, weatheroclock@CleoMenezesJr.github.io
  #   install_gnome_extension 5470
  # 750 | Open Weather
  install_gnome_extension 750

  # set enabled extensions, the array represents ALL enabled.  So anything not in the array is disabled
  dconf write "/org/gnome/shell/enabled-extensions" "['launch-new-instance@gnome-shell-extensions.gcampax.github.com', 'space-bar@luchrioh', 'openweather-extension@jenslody.de', 'just-perfection-desktop@just-perfection', 'forge@jmmaranan.com', 'executor@raujonas.github.io', 'caffeine@patapon.info', 'blur-my-shell@aunetx', 'appindicatorsupport@rgcjonas.gmail.com', 'WallpaperSwitcher@Rishu']"

  # set extension preferences
  dconf write "/org/gnome/shell/extensions/executor/center-active" "false"
  dconf write "/org/gnome/shell/extensions/executor/left-index" "3"
  dconf write "/org/gnome/shell/extensions/executor/right-active" "false"
  dconf write "/org/gnome/shell/extensions/forge/frequency/tiling-mode-enabled" "true"
  dconf write "/org/gnome/shell/extensions/forge/frequency/window-gap-size-increment" "1"
  dconf write "/org/gnome/shell/extensions/just-perfection/accessibility-menu" "false"
  dconf write "/org/gnome/shell/extensions/just-perfection/activities-button" "false"
  dconf write "/org/gnome/shell/extensions/just-perfection/app-menu-label" "false"
  dconf write "/org/gnome/shell/extensions/just-perfection/startup-status" "0"
  dconf write "/org/gnome/shell/extensions/openweather/actual-city" "2"
  dconf write "/org/gnome/shell/extensions/openweather/city" "'30.2711286,-97.7436995>Austin, Travis County, Texas, United States>0 && 39.7392364,-104.984862>Denver, Colorado, United States>0 && 34.2783355,-119.293174>Ventura, Ventura County, CAL Fire Southern Region, California, United States>0'"
  dconf write "/org/gnome/shell/extensions/openweather/position-index" "1"
  dconf write "/org/gnome/shell/extensions/openweather/unit" "'fahrenheit'"
  dconf write "/org/gnome/shell/extensions/openweather/wind-speed-unit" "'mph'"
  dconf write "/org/gnome/shell/extensions/space-bar/behavior/show-empty-workspaces" "false"
  dconf write "/org/gnome/shell/extensions/WallpaperSwitcher/frequency" "1200"
  dconf write "/org/gnome/shell/extensions/WallpaperSwitcher/wallpaper-path" "'/home/mid/portable/wallpapers/desktop'"
}

menu

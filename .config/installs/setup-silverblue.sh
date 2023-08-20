#!/usr/bin/env bash
cd "$(dirname "${0}")" || exit

menu(){
  clear
  echo -ne "
 \e[38;5;39m
███████╗██╗██╗    ██╗   ██╗███████╗██████╗ ██████╗ ██╗     ██╗   ██╗███████╗
██╔════╝██║██║    ██║   ██║██╔════╝██╔══██╗██╔══██╗██║     ██║   ██║██╔════╝
███████╗██║██║    ██║   ██║█████╗  ██████╔╝██████╔╝██║     ██║   ██║█████╗
╚════██║██║██║    ╚██╗ ██╔╝██╔══╝  ██╔══██╗██╔══██╗██║     ██║   ██║██╔══╝
███████║██║███████╗╚████╔╝ ███████╗██║  ██║██████╔╝███████╗╚██████╔╝███████╗
╚══════╝╚═╝╚══════╝ ╚═══╝  ╚══════╝╚═╝  ╚═╝╚═════╝ ╚══════╝ ╚═════╝ ╚══════╝
\e[38;5;220m
INITIAL SETUP STEPS:
  1) os-tree upgrade
  2) os-tree add layers
  3) userland
\e[38;5;249m
OPTIONAL RE-INSTALLS:
  e) install gnome extensions
  f) install flatpacks
\e[38;5;7m
: "

    read -r version
    case $version in
      1)  sudo rpm-ostree upgrade
          systemctl reboot
          ;;

      2)  rpm-ostree install alacritty
          systemctl reboot
          ;;

      3)  install_gnome_extensions
          install_flatpacks
          create_toolboxes
          ;;

      e)  install_gnome_extensions ;;
      f)  install_flatpacks ;;
      t)  create_toolboxes ;;
      *)  echo "unknown option $version"
          exit 1
          ;;
    esac
}

#==================================================================================================
install_gnome_ext(){
  shell_version=$(gnome-shell --version | cut -d' ' -f3)
  info_json=$(curl -sS "https://extensions.gnome.org/extension-info/?pk=$1&shell_version=$shell_version")
  download_url=$(echo $info_json | jq ".download_url" --raw-output)

  echo "==> installing gnome $shell_version extension $1 from $download_url"
  gnome-extensions install "https://extensions.gnome.org$download_url"
}

create_toolbox(){
  tag="docker.io/jeffwindsor/${filename}:latest"
  echo "==> creating toolbox $filename from image $tag"

  # remove old local
  toolbox rm "$filename" --force
  toolbox rmi "$tag"

  # build image and toolbox
  podman build --file="$filename" --tag="$tag"
  toolbox create "$filename" --image="$tag"
}

#==================================================================================================
create_toolboxes(){
  create_toolbox base
}

install_flatpacks(){
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

install_gnome_extensions(){
  # 615  | AppIndicator, https://github.com/ubuntu/gnome-shell-extension-appindicator, _
  install_gnome_ext 615
  # 3193 | Blur My Shell, https://github.com/aunetx/gnome-shell-extension-blur-my-shell, src
  install_gnome_ext 3193
  # 517  | Caffeine, https://github.com/eonpatapon/gnome-shell-extension-caffeine, caffeine@patapon.info
  install_gnome_ext 517
  # 2932 | Executor, https://github.com/raujonas/executor, executor@raujonas.github.io
  install_gnome_ext 2932
  # 4481 | Forge, https://github.com/jmmaranan/forge, _
  install_gnome_ext 4481
  # 3843 | Just Perfection, https://gitlab.gnome.org/jrahmatzadeh/just-perfection, src
  install_gnome_ext 3843
  # 5090 | Space Bar, https://github.com/christopher-l/space-bar, _
  install_gnome_ext 5090
  # 4812 | Wallpaper Switcher, https://github.com/rishuinfinity/WallpaperSwitcher, src
  install_gnome_ext 4812
  # 5470 | Weather O'Clock, https://github.com/CleoMenezesJr/weather-oclock, weatheroclock@CleoMenezesJr.github.io
  install_gnome_ext 5470
}

menu

#!/usr/bin/env bash

# add flathub repository (only if it does not exist)
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# helper install function
function install() {
  echo "==> $@"
  flatpak install -y "$1"
}

#== Web Browsers ==================================================================================
# install "org.chromium.Chromium"           # web browser
# install "org.mozilla.firefox"             # web browser
# install "io.gitlab.librewolf-community"   # web browser
# install "com.brave.Browser"               # web browser

#== System Tools ==================================================================================
install "com.gitlab.davem.ClamTk"         # virus
install "com.github.tchx84.Flatseal"      # flatpak sec manager
install "io.podman_desktop.PodmanDesktop" # manage pods
install "com.system76.Popsicle"           # flash multiple USB

#== Applications ==================================================================================
install "org.audacityteam.Audacity"       # sound engineering
install "org.gimp.GIMP"                   # image manipulation
install "org.gnucash.GnuCash"             # double entry accounting
install "org.libreoffice.LibreOffice"     # office suite
install "com.gitlab.newsflash"            # rss reader
install "md.obsidian.Obsidian"            # markdown editor
install "com.spotify.Client"              # music
install "com.transmissionbt.Transmission" # bit torrent
install "org.videolan.VLC"                # video player
install "com.rafaelmardojai.Blanket"      # Listen to different sounds

# install "nz.mega.MEGAsync"                   # cloud storage
# install "net.sourceforge.Klavaro"            # typing
# install "org.zealdocs.Zeal"                  # dev docs
# install "io.github.endless_sky.endless_sky"  # game
# install "com.discordapp.Discord"             # chat app
# install "com.valvesoftware.Steam"            # games

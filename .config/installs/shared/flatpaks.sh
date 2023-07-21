#!/usr/bin/env bash

# add flathub repository (only if it does not exist)
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# helper install function
function install() {
  echo "==> $@"
  flatpak install -y "$1"
}

#== Web Browsers ==================================================================================
install "com.google.Chrome"               # web browser
install "org.chromium.Chromium"           # web browser
install "io.gitlab.librewolf-community"   # web browser
install "org.mozilla.firefox"             # web browser

#== Applications ==================================================================================
# install "net.sourceforge.Klavaro"        # typing
install "com.github.tchx84.Flatseal"      # flatpak sec manager
install "com.gitlab.davem.ClamTk"         # virus
install "com.gitlab.newsflash"            # rss reader
install "com.spotify.Client"              # music
install "com.transmissionbt.Transmission" # bit torrent
install "md.obsidian.Obsidian"            # markdown editor
# install "nz.mega.MEGAsync"                # cloud storage
install "org.audacityteam.Audacity"       # sound engineering
install "org.gimp.GIMP"                   # image manipulation
install "org.gnucash.GnuCash"             # double entry accounting
install "org.libreoffice.LibreOffice"     # office suite
install "org.videolan.VLC"                # video player

# install "org.zealdocs.Zeal"                  # dev docs
# install "io.github.endless_sky.endless_sky"  # game
# install "com.discordapp.Discord"             # chat app
# install "com.valvesoftware.Steam"
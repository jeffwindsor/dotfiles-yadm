#!/usr/bin/env bash
# adapted from https://askubuntu.com/questions/1152583/install-gnome-shell-extensions-from-terminal

# 1. GNOME shell version
shell_version=$(gnome-shell --version | cut -d' ' -f3)

# 2. Fetch extension info (for the given shell version) example input: 307
info_json=$(curl -sS "https://extensions.gnome.org/extension-info/?pk=$1&shell_version=$shell_version")

# 3. Extract download url from the json with jq
download_url=$(echo $info_json | jq ".download_url" --raw-output)

# 4. Install the extension
echo "==> installing gnome $shell_version extension $1 from $download_url"
gnome-extensions install "https://extensions.gnome.org$download_url"

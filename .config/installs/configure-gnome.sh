#!/usr/bin/env bash

###############################################################################
# gnome
#
# to discover the key value pairs to set, run a terminal with `dconf watch/`
# then go about setting the values through the GUI and the key-value will be
# printed out for you.  Note you will not need all printed out values, since
# some are about movement (ie last placed visited) and you will have to build your
# line with the following pattern with values exactly as they are printed out
# dconf write "key" "value"
#
# I like to post test the lines I create in antoher terminal, but your milage
# may vary
#
###############################################################################
mods1="<Super>"
mods2="${mods1}<Control>"
mods3="${mods2}<Alt>"


dconf write "/org/gnome/desktop/calendar/show-weekdate" "true"
dconf write "/org/gnome/desktop/datetime/automatic-timezone" "true"
dconf write "/org/gnome/desktop/interface/clock-format" "'12h'"
dconf write "/org/gnome/desktop/interface/clock-show-weekday" "true"
dconf write "/org/gnome/desktop/interface/color-scheme" "'prefer-dark'"
dconf write "/org/gnome/desktop/interface/gtk-theme" "'Adwaita-dark'"
dconf write "/org/gnome/desktop/interface/locate-pointer" "true"
dconf write "/org/gnome/desktop/interface/text-scaling-factor" "1.25"
dconf write "/org/gnome/desktop/peripherals/touchpad/click-method" "'fingers'"
dconf write "/org/gnome/desktop/peripherals/touchpad/natural-scroll" "true"
dconf write "/org/gnome/desktop/peripherals/touchpad/speed" "0.4"
dconf write "/org/gnome/desktop/peripherals/touchpad/two-finger-scrolling-enabled" "true"
dconf write "/org/gnome/desktop/wm/keybindings/close" "['${mods1}q']"
dconf write "/org/gnome/desktop/wm/keybindings/minimize" "['${mods1}w']"
dconf write "/org/gnome/desktop/wm/keybindings/move-to-workspace-1" "['${mods2}1']"
dconf write "/org/gnome/desktop/wm/keybindings/move-to-workspace-10" "['${mods2}0']"
dconf write "/org/gnome/desktop/wm/keybindings/move-to-workspace-2" "['${mods2}2']"
dconf write "/org/gnome/desktop/wm/keybindings/move-to-workspace-3" "['${mods2}3']"
dconf write "/org/gnome/desktop/wm/keybindings/move-to-workspace-4" "['${mods2}4']"
dconf write "/org/gnome/desktop/wm/keybindings/move-to-workspace-5" "['${mods2}5']"
dconf write "/org/gnome/desktop/wm/keybindings/move-to-workspace-6" "['${mods2}6']"
dconf write "/org/gnome/desktop/wm/keybindings/move-to-workspace-7" "['${mods2}7']"
dconf write "/org/gnome/desktop/wm/keybindings/move-to-workspace-8" "['${mods2}8']"
dconf write "/org/gnome/desktop/wm/keybindings/move-to-workspace-9" "['${mods2}9']"
dconf write "/org/gnome/desktop/wm/keybindings/panel-run-dialog" "['${mods2}space']"
dconf write "/org/gnome/desktop/wm/keybindings/switch-input-source" "@as []"
dconf write "/org/gnome/desktop/wm/keybindings/switch-input-source-backward" "@as []"
dconf write "/org/gnome/desktop/wm/keybindings/switch-to-workspace-1" "['${mods1}1']"
dconf write "/org/gnome/desktop/wm/keybindings/switch-to-workspace-10" "['${mods1}0']"
dconf write "/org/gnome/desktop/wm/keybindings/switch-to-workspace-2" "['${mods1}2']"
dconf write "/org/gnome/desktop/wm/keybindings/switch-to-workspace-3" "['${mods1}3']"
dconf write "/org/gnome/desktop/wm/keybindings/switch-to-workspace-4" "['${mods1}4']"
dconf write "/org/gnome/desktop/wm/keybindings/switch-to-workspace-5" "['${mods1}5']"
dconf write "/org/gnome/desktop/wm/keybindings/switch-to-workspace-6" "['${mods1}6']"
dconf write "/org/gnome/desktop/wm/keybindings/switch-to-workspace-7" "['${mods1}7']"
dconf write "/org/gnome/desktop/wm/keybindings/switch-to-workspace-8" "['${mods1}8']"
dconf write "/org/gnome/desktop/wm/keybindings/switch-to-workspace-9" "['${mods1}9']"
dconf write "/org/gnome/desktop/wm/keybindings/toggle-fullscreen" "['${mods2}m']"
dconf write "/org/gnome/desktop/wm/preferences/button-layout" "'close:appmenu'"
dconf write "/org/gnome/desktop/wm/preferences/num-workspaces" "10"
dconf write "/org/gnome/mutter/dynamic-workspaces" "false"
dconf write "/org/gnome/mutter/keybindings/toggle-tiled-left" "@as []"
dconf write "/org/gnome/mutter/keybindings/toggle-tiled-right" "@as []"
dconf write "/org/gnome/mutter/workspaces-only-on-primary" "true"
dconf write "/org/gnome/nautilus/list-view/default-zoom-level" "'medium'"
dconf write "/org/gnome/nautilus/preferences/click-policy" "'single'"
dconf write "/org/gnome/nautilus/preferences/default-folder-viewer" "'list-view'"
dconf write "/org/gnome/nautilus/preferences/show-delete-permanently" "true"
dconf write "/org/gnome/settings-daemon/plugins/media-keys/control-center" "['${mods1}comma']"
dconf write "/org/gnome/settings-daemon/plugins/media-keys/home" "['${mods1}f']"
dconf write "/org/gnome/settings-daemon/plugins/media-keys/next" "['AudioForward']"
dconf write "/org/gnome/settings-daemon/plugins/media-keys/previous" "['AudioRewind']"
dconf write "/org/gnome/settings-daemon/plugins/media-keys/www" "['${mods1}b']"
dconf write "/org/gnome/shell/keybindings/focus-active-notification" "@as []"
dconf write "/org/gnome/shell/keybindings/show-screenshot-ui" "['<Control>grave']"
dconf write "/org/gnome/shell/keybindings/switch-to-application-1" "@as []"
dconf write "/org/gnome/shell/keybindings/switch-to-application-10" "@as []"
dconf write "/org/gnome/shell/keybindings/switch-to-application-2" "@as []"
dconf write "/org/gnome/shell/keybindings/switch-to-application-3" "@as []"
dconf write "/org/gnome/shell/keybindings/switch-to-application-4" "@as []"
dconf write "/org/gnome/shell/keybindings/switch-to-application-5" "@as []"
dconf write "/org/gnome/shell/keybindings/switch-to-application-6" "@as []"
dconf write "/org/gnome/shell/keybindings/switch-to-application-7" "@as []"
dconf write "/org/gnome/shell/keybindings/switch-to-application-8" "@as []"
dconf write "/org/gnome/shell/keybindings/switch-to-application-9" "@as []"
dconf write "/org/gnome/shell/keybindings/toggle-message-tray" "@as []"
dconf write "/org/gtk/gtk4/settings/file-chooser/show-hidden" "true"
dconf write "/org/gtk/settings/file-chooser/clock-format" "'12h'"

###############################################################################
# Custom Key Bindings
###############################################################################
custom_keys="/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings"
custom="${custom_keys}/custom"

dconf write "$custom_keys" "[\
  '${custom}0/','${custom}1/','${custom}2/','${custom}3/',\
  '${custom}4/','${custom}5/','${custom}6/','${custom}7/',\
  '${custom}8/']"

dconf write "${custom}0/binding" "'${mods2}l'"
dconf write "${custom}0/command" "'gnome-session-quit'"
dconf write "${custom}0/name" "'Logout'"

dconf write "${custom}1/binding" "'${mods2}p'"
dconf write "${custom}1/command" "'systemctl poweroff'"
dconf write "${custom}1/name" "'Power-Off'"

dconf write "${custom}2/binding" "'${mods2}r'"
dconf write "${custom}2/command" "'systemctl reboot'"
dconf write "${custom}2/name" "'Reboot'"

dconf write "${custom}3/binding" "'${mods2}s'"
dconf write "${custom}3/command" "'systemctl suspend'"
dconf write "${custom}3/name" "'Suspend'"

#dconf write "${custom}4/binding" "'${mods2}t'"
#dconf write "${custom}4/command" "'env WINIT_UNIX_BACKEND=x11 alacritty --config-file \"$HOME\"/.config/alacritty/alacritty-ostree.yml'"
#dconf write "${custom}4/name" "'OS-Tree'"


dconf write "${custom}4/binding" "'${mods1}o'"
dconf write "${custom}4/command" "'flatpak run md.obsidian.Obsidian'"
dconf write "${custom}4/name" "'Obsidian'"

dconf write "${custom}5/binding" "'${mods1}e'"
dconf write "${custom}5/command" "'extension-manager'"
dconf write "${custom}5/name" "'Extensions'"

dconf write "${custom}6/binding" "'${mods1}g'"
dconf write "${custom}6/command" "'flatpak run org.gnucash.GnuCash'"
dconf write "${custom}6/name" "'GNU Cash'"

dconf write "/org/gnome/shell/keybindings/toggle-overview" "@as []"
dconf write "${custom}7/binding" "'${mods1}s'"
dconf write "${custom}7/command" "'flatpak run com.spotify.Client'"
dconf write "${custom}7/name" "'Spotify'"

dconf write "${custom}8/binding" "'${mods1}t'"
dconf write "${custom}8/command" "'env WINIT_UNIX_BACKEND=x11 alacritty'"
dconf write "${custom}8/name" "'Terminal'"

###############################################################################
# extensions
###############################################################################
# enable preferred extensions
dconf write "/org/gnome/shell/enabled-extensions" "['launch-new-instance@gnome-shell-extensions.gcampax.github.com', 'openweather-extension@jenslody.de', 'forge@jmmaranan.com', 'caffeine@patapon.info', 'blur-my-shell@aunetx', 'WallpaperSwitcher@Rishu', 'appindicatorsupport@rgcjonas.gmail.com', 'just-perfection-desktop@just-perfection', 'pano@elhan.io']"
dconf write "/org/gnome/shell/disabled-extensions" "['space-bar@luchrioh', 'executor@raujonas.github.io', 'clipman@popov895.ukr.net', 'auto-move-windows@gnome-shell-extensions.gcampax.github.com']"

# | AppIndicator      |  615

# | Blur My Shell     | 3193

# | Caffeine          |  517
dconf write "/org/gnome/shell/extensions/caffeine/toggle-shortcut" "['<Super>Delete']"

# | Executor          | 2932
dconf write "/org/gnome/shell/extensions/executor/center-active" "false"
dconf write "/org/gnome/shell/extensions/executor/left-index" "3"
dconf write "/org/gnome/shell/extensions/executor/right-active" "false"
dconf write "/org/gnome/shell/extensions/executor/left-commands-json" "'{\"commands\":[{\"isActive\":true,\"command\":\"fortune $HOME/.config/fortune/quotes\",\"interval\":600,\"uuid\":\"e029a6a2-3ba2-424b-bcc3-bf74d39fe75a\"}]}'"

# | Forge             | 4481
dconf write "/org/gnome/shell/extensions/forge/frequency/tiling-mode-enabled" "true"
dconf write "/org/gnome/shell/extensions/forge/frequency/window-gap-size-increment" "1"
dconf write "/org/gnome/shell/extensions/forge/keybindings/focus-border-toggle" "@as []"
dconf write "/org/gnome/shell/extensions/forge/keybindings/prefs-tiling-toggle" "@as []"
dconf write "/org/gnome/shell/extensions/forge/keybindings/prefs-open" "['${mods2}Period']"

# Containers
dconf write "/org/gnome/shell/extensions/forge/keybindings/con-split-layout-horizontal" "['${mods2}h']"
dconf write "/org/gnome/shell/extensions/forge/keybindings/con-split-layout-toggle" "@as []"
dconf write "/org/gnome/shell/extensions/forge/keybindings/con-split-layout-vertical" "['${mods2}v']"
dconf write "/org/gnome/shell/extensions/forge/keybindings/con-stacked-layout-toggle" "@as []"
dconf write "/org/gnome/shell/extensions/forge/keybindings/con-tabbed-layout-toogle" "@as []"
dconf write "/org/gnome/shell/extensions/forge/keybindings/con-tabbed-showtab-decoration-toggle" "@as []"

#   Workspace
#     Tiling
dconf write "/org/gnome/shell/extensions/forge/keybindings/workspace-active-tile-toggle" "['${mods2}f']"

#   Window
#     Toogle Floating and Tiled
dconf write "/org/gnome/shell/extensions/forge/keybindings/window-toggle-float" "['${mods3}f']"
dconf write "/org/gnome/shell/extensions/forge/keybindings/window-toggle-float-always" "@as []"
#     Focus
dconf write "/org/gnome/shell/extensions/forge/keybindings/window-focus-down" "['${mods1}j']"
dconf write "/org/gnome/shell/extensions/forge/keybindings/window-focus-up" "['${mods1}/k']"
dconf write "/org/gnome/shell/extensions/forge/keybindings/window-focus-left" "['${mods1}/h']"
dconf write "/org/gnome/shell/extensions/forge/keybindings/window-focus-right" "['${mods1}/l']"
#     Move
dconf write "/org/gnome/shell/extensions/forge/keybindings/window-move-down" "['${mods2}/j']"
dconf write "/org/gnome/shell/extensions/forge/keybindings/window-move-up" "['${mods2}/k']"
dconf write "/org/gnome/shell/extensions/forge/keybindings/window-move-left" "['${mods2}/h']"
dconf write "/org/gnome/shell/extensions/forge/keybindings/window-move-right" "['${mods2}/l']"
#     Size
dconf write "/org/gnome/shell/extensions/forge/keybindings/window-move-down" "['${mods3}/j']"
dconf write "/org/gnome/shell/extensions/forge/keybindings/window-move-up" "['${mods3}/k']"
dconf write "/org/gnome/shell/extensions/forge/keybindings/window-move-left" "['${mods3}/h']"
dconf write "/org/gnome/shell/extensions/forge/keybindings/window-move-right" "['${mods3}/l']"
#     Swap - removed only use move
dconf write "/org/gnome/shell/extensions/forge/keybindings/window-swap-down" "@as []"
dconf write "/org/gnome/shell/extensions/forge/keybindings/window-swap-up" "@as []"
dconf write "/org/gnome/shell/extensions/forge/keybindings/window-swap-left" "@as []"
dconf write "/org/gnome/shell/extensions/forge/keybindings/window-swap-right" "@as []"
#     Snap - removed becuase do not use
dconf write "/org/gnome/shell/extensions/forge/keybindings/window-snap-center" "@as []"
dconf write "/org/gnome/shell/extensions/forge/keybindings/window-snap-one-third-left" "@as []"
dconf write "/org/gnome/shell/extensions/forge/keybindings/window-snap-one-third-right" "@as []"
dconf write "/org/gnome/shell/extensions/forge/keybindings/window-snap-two-third-left" "@as []"
dconf write "/org/gnome/shell/extensions/forge/keybindings/window-snap-two-third-right" "@as []"


# | Just Perfection   | 3843
dconf write "/org/gnome/shell/extensions/just-perfection/accessibility-menu" "false"
dconf write "/org/gnome/shell/extensions/just-perfection/activities-button" "false"
dconf write "/org/gnome/shell/extensions/just-perfection/app-menu-label" "false"
#   show desktop on login, not the overview
dconf write "/org/gnome/shell/extensions/just-perfection/startup-status" "0"
#   show top panel only on the overview
dconf write "/org/gnome/shell/extensions/just-perfection/panel" "false"
dconf write "/org/gnome/shell/extensions/just-perfection/panel-in-overview" "true"

# | Open Weather      |  750
dconf write "/org/gnome/shell/extensions/openweather/actual-city" "2"
dconf write "/org/gnome/shell/extensions/openweather/city" "'30.2711286,-97.7436995>Austin, Travis County, Texas, United States>0 && 39.7392364,-104.984862>Denver, Colorado, United States>0 && 34.2783355,-119.293174>Ventura, Ventura County, CAL Fire Southern Region, California, United States>0'"
dconf write "/org/gnome/shell/extensions/openweather/position-index" "1"
dconf write "/org/gnome/shell/extensions/openweather/unit" "'fahrenheit'"
dconf write "/org/gnome/shell/extensions/openweather/wind-speed-unit" "'mph'"

# | Space Bar         | 5090
dconf write "/org/gnome/shell/extensions/space-bar/behavior/show-empty-workspaces" "false"

# | Wallpaper Switcher| 4812
dconf write "/org/gnome/shell/extensions/WallpaperSwitcher/frequency" "1200"
dconf write "/org/gnome/shell/extensions/WallpaperSwitcher/wallpaper-path" "'/home/mid/portable/wallpapers/desktop'"

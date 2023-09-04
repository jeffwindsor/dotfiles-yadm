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
super="<Super>"
control="<Control>"
alt="<Alt>"
mods1="${super}"
mods2="${mods1}${control}"
mods3="${mods2}${alt}"
custom_keys="/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings"
custom="${custom_keys}/custom"

# Custom Key Bindings must register here by number
dconf write "$custom_keys" "[\
  '${custom}0/','${custom}1/','${custom}2/','${custom}3/',\
  '${custom}4/','${custom}5/','${custom}6/','${custom}7/',\
  '${custom}8/']"

# Disable to avoid accidental use or duplication
dconf write "/org/gnome/desktop/wm/keybindings/begin-move" "@as []"
dconf write "/org/gnome/desktop/wm/keybindings/begin-resize" "@as []"
dconf write "/org/gnome/desktop/wm/keybindings/maximize" "@as []"
dconf write "/org/gnome/desktop/wm/keybindings/minimize" "@as []"
dconf write "/org/gnome/desktop/wm/keybindings/panel-run-dialog" "@as []"
dconf write "/org/gnome/desktop/wm/keybindings/switch-input-source" "@as []"
dconf write "/org/gnome/desktop/wm/keybindings/switch-input-source-backward" "@as []"
dconf write "/org/gnome/desktop/wm/keybindings/toggle-fullscreen" "@as []"
dconf write "/org/gnome/desktop/wm/keybindings/toggle-maximized" "@as []"
dconf write "/org/gnome/mutter/keybindings/toggle-tiled-left" "@as []"
dconf write "/org/gnome/mutter/keybindings/toggle-tiled-right" "@as []"
dconf write "/org/gnome/mutter/wayland/keybindings/restore-shortcuts" "@as []"
dconf write "/org/gnome/settings-daemon/plugins/media-keys/help" "@as []"
dconf write "/org/gnome/settings-daemon/plugins/media-keys/logout" "@as []"
dconf write "/org/gnome/settings-daemon/plugins/media-keys/magnifier" "@as []"
dconf write "/org/gnome/settings-daemon/plugins/media-keys/magnifier-zoom-in" "@as []"
dconf write "/org/gnome/settings-daemon/plugins/media-keys/magnifier-zoom-out" "@as []"
dconf write "/org/gnome/settings-daemon/plugins/media-keys/screenreader" "@as []"
dconf write "/org/gnome/settings-daemon/plugins/media-keys/screensaver" "@as []"
dconf write "/org/gnome/shell/extensions/forge/keybindings/con-split-layout-toggle" "@as []"
dconf write "/org/gnome/shell/extensions/forge/keybindings/con-stacked-layout-toggle" "@as []"
dconf write "/org/gnome/shell/extensions/forge/keybindings/con-tabbed-layout-toogle" "@as []"
dconf write "/org/gnome/shell/extensions/forge/keybindings/con-tabbed-showtab-decoration-toggle" "@as []"
dconf write "/org/gnome/shell/extensions/forge/keybindings/prefs-open" "@as []"
dconf write "/org/gnome/shell/extensions/forge/keybindings/window-snap-center" "@as []"
dconf write "/org/gnome/shell/extensions/forge/keybindings/window-snap-one-third-left" "@as []"
dconf write "/org/gnome/shell/extensions/forge/keybindings/window-snap-one-third-right" "@as []"
dconf write "/org/gnome/shell/extensions/forge/keybindings/window-snap-two-third-left" "@as []"
dconf write "/org/gnome/shell/extensions/forge/keybindings/window-snap-two-third-right" "@as []"
dconf write "/org/gnome/shell/extensions/forge/keybindings/window-swap-down" "@as []"
dconf write "/org/gnome/shell/extensions/forge/keybindings/window-swap-left" "@as []"
dconf write "/org/gnome/shell/extensions/forge/keybindings/window-swap-right" "@as []"
dconf write "/org/gnome/shell/extensions/forge/keybindings/window-swap-up" "@as []"
dconf write "/org/gnome/shell/extensions/forge/keybindings/window-toggle-float-always" "@as []"
dconf write "/org/gnome/shell/keybindings/focus-active-notification" "@as []"
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
dconf write "/org/gnome/shell/keybindings/toggle-overview" "@as []"

# SPECIALS ====================================================================
dconf write "/org/gnome/settings-daemon/plugins/media-keys/next" "['AudioForward']"
dconf write "/org/gnome/settings-daemon/plugins/media-keys/previous" "['AudioRewind']"
dconf write "/org/gnome/shell/keybindings/open-application-menu" "['${alt}1']"
dconf write "/org/gnome/shell/keybindings/show-screenshot-ui" "['{$control}grave']"

# MOD CHORD 1 =================================================================
dconf write "/org/gnome/desktop/wm/keybindings/switch-to-workspace-1" "['${mods1}1']"
dconf write "/org/gnome/desktop/wm/keybindings/switch-to-workspace-2" "['${mods1}2']"
dconf write "/org/gnome/desktop/wm/keybindings/switch-to-workspace-3" "['${mods1}3']"
dconf write "/org/gnome/desktop/wm/keybindings/switch-to-workspace-4" "['${mods1}4']"
dconf write "/org/gnome/desktop/wm/keybindings/switch-to-workspace-5" "['${mods1}5']"
dconf write "/org/gnome/desktop/wm/keybindings/switch-to-workspace-6" "['${mods1}6']"
dconf write "/org/gnome/desktop/wm/keybindings/switch-to-workspace-7" "['${mods1}7']"
dconf write "/org/gnome/desktop/wm/keybindings/switch-to-workspace-8" "['${mods1}8']"
dconf write "/org/gnome/desktop/wm/keybindings/switch-to-workspace-9" "['${mods1}9']"
dconf write "/org/gnome/desktop/wm/keybindings/switch-to-workspace-10" "['${mods1}0']"
dconf write "/org/gnome/shell/keybindings/toggle-application-view" "['${mods1}a']"
dconf write "/org/gnome/settings-daemon/plugins/media-keys/www" "['${mods1}b']"
dconf write "/org/gnome/settings-daemon/plugins/media-keys/calculator" "['${mods1}c']"
# d
dconf write "${custom}5/binding" "'${mods1}e'"
dconf write "${custom}5/command" "'extension-manager'"
dconf write "${custom}5/name" "'Extensions'"
dconf write "/org/gnome/settings-daemon/plugins/media-keys/home" "['${mods1}f']"
dconf write "${custom}6/binding" "'${mods1}g'"
dconf write "${custom}6/command" "'flatpak run org.gnucash.GnuCash'"
dconf write "${custom}6/name" "'GNU Cash'"
dconf write "/org/gnome/shell/extensions/forge/keybindings/window-focus-left" "['${mods1}h']"
# i
dconf write "/org/gnome/shell/extensions/forge/keybindings/window-focus-down" "['${mods1}j']"
dconf write "/org/gnome/shell/extensions/forge/keybindings/window-focus-up" "['${mods1}k']"
dconf write "/org/gnome/shell/extensions/forge/keybindings/window-focus-right" "['${mods1}l']"
# m
dconf write "${custom}4/binding" "'${mods1}o'"
dconf write "${custom}4/command" "'flatpak run md.obsidian.Obsidian'"
dconf write "${custom}4/name" "'Obsidian'"
# p
dconf write "/org/gnome/desktop/wm/keybindings/close" "['${mods1}q']"
# r
dconf write "${custom}7/binding" "'${mods1}s'"
dconf write "${custom}7/command" "'flatpak run com.spotify.Client'"
dconf write "${custom}7/name" "'Spotify'"
dconf write "${custom}8/binding" "'${mods1}t'"
dconf write "${custom}8/command" "'env WINIT_UNIX_BACKEND=x11 alacritty'"
dconf write "${custom}8/name" "'Terminal'"
# u,v,w,x,y,z
dconf write "/org/gnome/shell/extensions/caffeine/toggle-shortcut" "['${mods1}Delete']"


# MOD CHORD 2 =================================================================
dconf write "/org/gnome/desktop/wm/keybindings/move-to-workspace-1" "['${mods2}1']"
dconf write "/org/gnome/desktop/wm/keybindings/move-to-workspace-2" "['${mods2}2']"
dconf write "/org/gnome/desktop/wm/keybindings/move-to-workspace-3" "['${mods2}3']"
dconf write "/org/gnome/desktop/wm/keybindings/move-to-workspace-4" "['${mods2}4']"
dconf write "/org/gnome/desktop/wm/keybindings/move-to-workspace-5" "['${mods2}5']"
dconf write "/org/gnome/desktop/wm/keybindings/move-to-workspace-6" "['${mods2}6']"
dconf write "/org/gnome/desktop/wm/keybindings/move-to-workspace-7" "['${mods2}7']"
dconf write "/org/gnome/desktop/wm/keybindings/move-to-workspace-8" "['${mods2}8']"
dconf write "/org/gnome/desktop/wm/keybindings/move-to-workspace-9" "['${mods2}9']"
dconf write "/org/gnome/desktop/wm/keybindings/move-to-workspace-10" "['${mods2}0']"
# a,b,c,d,e
dconf write "/org/gnome/shell/extensions/forge/keybindings/window-toggle-float" "['${mods2}f']"
#g
dconf write "/org/gnome/shell/extensions/forge/keybindings/window-move-left" "['${mods2}h']"
# i
dconf write "/org/gnome/shell/extensions/forge/keybindings/window-move-down" "['${mods2}j']"
dconf write "/org/gnome/shell/extensions/forge/keybindings/window-move-up" "['${mods2}k']"
dconf write "/org/gnome/shell/extensions/forge/keybindings/window-move-right" "['${mods2}l']"
# m,n,o
dconf write "${custom}1/binding" "'${mods2}p'"
dconf write "${custom}1/command" "'systemctl poweroff'"
dconf write "${custom}1/name" "'Power-Off'"
dconf write "${custom}0/binding" "'${mods2}q'"
dconf write "${custom}0/command" "'gnome-session-quit'"
dconf write "${custom}0/name" "'Logout'"
dconf write "${custom}2/binding" "'${mods2}r'"
dconf write "${custom}2/command" "'systemctl reboot'"
dconf write "${custom}2/name" "'Reboot'"
dconf write "${custom}3/binding" "'${mods2}s'"
dconf write "${custom}3/command" "'systemctl suspend'"
dconf write "${custom}3/name" "'Suspend'"
# t,u,v,w,x,y,z
#     Settings
dconf write "/org/gnome/settings-daemon/plugins/media-keys/control-center" "['${mods1}comma']"
#     Toogle Tiling
dconf write "/org/gnome/shell/extensions/forge/keybindings/workspace-active-tile-toggle" "['${mods2}Delete']"
#     Tiling Window Spawn Direction
dconf write "/org/gnome/shell/extensions/forge/keybindings/con-split-layout-horizontal" "['${mods2}Right']"
dconf write "/org/gnome/shell/extensions/forge/keybindings/con-split-layout-vertical" "['${mods2}Down']"


# MOD CHORD 3 =================================================================
# a,b,c,d,e,f,g
dconf write "/org/gnome/shell/extensions/forge/keybindings/window-move-left" "['${mods3}h']"
# i
dconf write "/org/gnome/shell/extensions/forge/keybindings/window-move-down" "['${mods3}j']"
dconf write "/org/gnome/shell/extensions/forge/keybindings/window-move-up" "['${mods3}k']"
dconf write "/org/gnome/shell/extensions/forge/keybindings/window-move-right" "['${mods3}l']"
# m,n,o,p,q,r,s,t,u,v,w,x,y,z

###############################################################################
# configurations

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
dconf write "/org/gnome/desktop/wm/preferences/button-layout" "'close:appmenu'"
dconf write "/org/gnome/desktop/wm/preferences/num-workspaces" "10"
dconf write "/org/gnome/mutter/dynamic-workspaces" "false"
dconf write "/org/gnome/mutter/workspaces-only-on-primary" "true"

dconf write "/org/gnome/nautilus/list-view/default-zoom-level" "'medium'"
dconf write "/org/gnome/nautilus/preferences/click-policy" "'single'"
dconf write "/org/gnome/nautilus/preferences/default-folder-viewer" "'list-view'"
dconf write "/org/gnome/nautilus/preferences/show-delete-permanently" "true"
dconf write "/org/gtk/gtk4/settings/file-chooser/show-hidden" "true"
dconf write "/org/gtk/settings/file-chooser/clock-format" "'12h'"

dconf write "/org/gnome/shell/enabled-extensions" "['launch-new-instance@gnome-shell-extensions.gcampax.github.com', 'openweather-extension@jenslody.de', 'forge@jmmaranan.com', 'caffeine@patapon.info', 'blur-my-shell@aunetx', 'WallpaperSwitcher@Rishu', 'appindicatorsupport@rgcjonas.gmail.com', 'just-perfection-desktop@just-perfection', 'pano@elhan.io']"
dconf write "/org/gnome/shell/disabled-extensions" "['space-bar@luchrioh', 'executor@raujonas.github.io', 'clipman@popov895.ukr.net', 'auto-move-windows@gnome-shell-extensions.gcampax.github.com']"
dconf write "/org/gnome/shell/extensions/executor/center-active" "false"
dconf write "/org/gnome/shell/extensions/executor/left-commands-json" "'{\"commands\":[{\"isActive\":true,\"command\":\"fortune $HOME/.config/fortune/quotes\",\"interval\":600,\"uuid\":\"e029a6a2-3ba2-424b-bcc3-bf74d39fe75a\"}]}'"
dconf write "/org/gnome/shell/extensions/executor/left-index" "3"
dconf write "/org/gnome/shell/extensions/executor/right-active" "false"
dconf write "/org/gnome/shell/extensions/forge/frequency/tiling-mode-enabled" "true"
dconf write "/org/gnome/shell/extensions/forge/frequency/window-gap-size-increment" "1"
dconf write "/org/gnome/shell/extensions/forge/keybindings/focus-border-toggle" "@as []"
dconf write "/org/gnome/shell/extensions/forge/keybindings/prefs-tiling-toggle" "@as []"
dconf write "/org/gnome/shell/extensions/just-perfection/accessibility-menu" "false"
dconf write "/org/gnome/shell/extensions/just-perfection/activities-button" "false"
dconf write "/org/gnome/shell/extensions/just-perfection/app-menu-label" "false"
dconf write "/org/gnome/shell/extensions/just-perfection/panel" "false"           #   show top panel only on the overview
dconf write "/org/gnome/shell/extensions/just-perfection/panel-in-overview" "true"
dconf write "/org/gnome/shell/extensions/just-perfection/startup-status" "0"      #   show desktop on login, not the overview
dconf write "/org/gnome/shell/extensions/openweather/actual-city" "2"
dconf write "/org/gnome/shell/extensions/openweather/city" "'30.2711286,-97.7436995>Austin, Travis County, Texas, United States>0 && 39.7392364,-104.984862>Denver, Colorado, United States>0 && 34.2783355,-119.293174>Ventura, Ventura County, CAL Fire Southern Region, California, United States>0'"
dconf write "/org/gnome/shell/extensions/openweather/position-index" "1"
dconf write "/org/gnome/shell/extensions/openweather/unit" "'fahrenheit'"
dconf write "/org/gnome/shell/extensions/openweather/wind-speed-unit" "'mph'"
dconf write "/org/gnome/shell/extensions/space-bar/behavior/show-empty-workspaces" "false"
dconf write "/org/gnome/shell/extensions/WallpaperSwitcher/frequency" "1200"
dconf write "/org/gnome/shell/extensions/WallpaperSwitcher/wallpaper-path" "'/home/mid/portable/wallpapers/desktop'"

-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
-- config.color_scheme = 'tender'
config.color_scheme = 'Nord'
config.font = wezterm.font 'JetBrainsMono Nerd Font Mono'
config.font_size = 14.0
config.window_background_opacity = 0.98
config.window_close_confirmation = 'NeverPrompt'

-- and finally, return the configuration to wezterm
return config

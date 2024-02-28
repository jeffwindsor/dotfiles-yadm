-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- =============================================================
-- COLOR SCHEME: DARK
-- config.color_scheme = 'Bitmute (terminal.sexy)'
-- config.color_scheme = 'Batman'
-- config.color_scheme = 'Gruvbox Dark (Gogh)'
-- config.color_scheme = 'Kanagawa (Gogh)'
-- config.color_scheme = 'Nord (Gogh)'
-- config.color_scheme = 'OceanicNext (base16)'
-- config.color_scheme = "Solarized (dark) (terminal.sexy)"
-- config.color_scheme = "Tender (Gogh)"
-- config.color_scheme = 'Tokyo Night (Gogh)'
config.color_scheme = "Tokyo Night Storm (Gogh)"

-- COLOR SCHEME: LIGHT
-- config.color_scheme = 'Solarized (light) (terminal.sexy)'

-- =============================================================
-- FONT:
config.font = wezterm.font("JetBrainsMono Nerd Font Mono")
config.font_size = 14.0

-- =============================================================
-- WINDOW:
config.window_background_opacity = 0.98
config.window_close_confirmation = "NeverPrompt"

-- =============================================================
-- and finally, return the configuration to wezterm
return config

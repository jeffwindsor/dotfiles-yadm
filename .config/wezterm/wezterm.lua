-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- =============================================================
-- COLOR SCHEME:
config.color_scheme = "Tokyo Night Storm (Gogh)"

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

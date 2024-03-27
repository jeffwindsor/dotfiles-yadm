-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()
-- =============================================================

-- COLOR SCHEME:
config.color_scheme = "Tokyo Night Storm (Gogh)"

-- FONT:
config.font = wezterm.font("JetBrainsMono Nerd Font Mono")
config.font_size = 14.0

-- WINDOW:
config.window_background_opacity = 0.98
config.window_close_confirmation = "NeverPrompt"

-- NAMED KEY TABLES
local act = wezterm.action

config.keys = {
	-- Super+Alt+Ctrl Space => enter pane management key mode
	{
		key = "Space",
		mods = "CTRL|ALT|SUPER",
		action = act.ActivateKeyTable({
			name = "pane_management",
			one_shot = false,
		}),
	},
}

config.key_tables = {
	pane_management = {
		-- CLOSE
		{ key = "x", mods = "CTRL", action = act.CloseCurrentPane({ confirm = false }) },

		-- ACTIVATE
		{ key = "LeftArrow", action = act.ActivatePaneDirection("Left") },
		{ key = "h", action = act.ActivatePaneDirection("Left") },
		{ key = "RightArrow", action = act.ActivatePaneDirection("Right") },
		{ key = "l", action = act.ActivatePaneDirection("Right") },
		{ key = "UpArrow", action = act.ActivatePaneDirection("Up") },
		{ key = "k", action = act.ActivatePaneDirection("Up") },
		{ key = "DownArrow", action = act.ActivatePaneDirection("Down") },
		{ key = "j", action = act.ActivatePaneDirection("Down") },

		-- RESIZE
		{ key = "LeftArrow", mods = "CTRL", action = act.AdjustPaneSize({ "Left", 1 }) },
		{ key = "h", mods = "CTRL", action = act.AdjustPaneSize({ "Left", 1 }) },
		{ key = "RightArrow", mods = "CTRL", action = act.AdjustPaneSize({ "Right", 1 }) },
		{ key = "l", mods = "CTRL", action = act.AdjustPaneSize({ "Right", 1 }) },
		{ key = "UpArrow", mods = "CTRL", action = act.AdjustPaneSize({ "Up", 1 }) },
		{ key = "k", mods = "CTRL", action = act.AdjustPaneSize({ "Up", 1 }) },
		{ key = "DownArrow", mods = "CTRL", action = act.AdjustPaneSize({ "Down", 1 }) },
		{ key = "j", mods = "CTRL", action = act.AdjustPaneSize({ "Down", 1 }) },

		-- SPLIT
		{ key = "LeftArrow", mods = "CTRL|ALT", action = act.SplitPane({ direction = "Left" }) },
		{ key = "h", mods = "CTRL|ALT", action = act.SplitPane({ direction = "Left" }) },
		{ key = "RightArrow", mods = "CTRL|ALT", action = act.SplitPane({ direction = "Right" }) },
		{ key = "l", mods = "CTRL|ALT", action = act.SplitPane({ direction = "Right" }) },
		{ key = "UpArrow", mods = "CTRL|ALT", action = act.SplitPane({ direction = "Up" }) },
		{ key = "k", mods = "CTRL|ALT", action = act.SplitPane({ direction = "Up" }) },
		{ key = "DownArrow", mods = "CTRL|ALT", action = act.SplitPane({ direction = "Down" }) },
		{ key = "j", mods = "CTRL|ALT", action = act.SplitPane({ direction = "Down" }) },

		-- Cancel the mode by pressing escape
		{ key = "Escape", action = "PopKeyTable" },
	},
}

-- =============================================================
-- and finally, return the configuration to wezterm
return config

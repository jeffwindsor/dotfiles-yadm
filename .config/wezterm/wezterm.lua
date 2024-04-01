local wezterm = require("wezterm")
local config = wezterm.config_builder()
local act = wezterm.action

-- =============================================================

config.color_scheme = 'tender (base16)'
config.font = wezterm.font("JetBrainsMono Nerd Font Mono")
config.font_size = 14.0
config.window_background_opacity = 0.98
config.window_close_confirmation = "NeverPrompt"

-- =============================================================

config.keys = {
	-- ENTER PANE MANAGEMENT KEY MODE
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

		{ key = "Escape", action = "PopKeyTable" }, -- CANCEL MODE
		{ key = "q", action = act.CloseCurrentPane({ confirm = false }) }, -- CLOSE
		{ key = "x", action = act.CloseCurrentPane({ confirm = false }) }, -- CLOSE

		-- ACTIVATE
		{ key = "h", action = act.ActivatePaneDirection("Left") },
		{ key = "l", action = act.ActivatePaneDirection("Right") },
		{ key = "k", action = act.ActivatePaneDirection("Up") },
		{ key = "j", action = act.ActivatePaneDirection("Down") },

		-- SPLIT
		{ key = "h", mods = "CTRL", action = act.SplitPane({ direction = "Left" }) },
		{ key = "k", mods = "CTRL", action = act.SplitPane({ direction = "Up" }) },
		{ key = "l", mods = "CTRL", action = act.SplitPane({ direction = "Right" }) },
		{ key = "j", mods = "CTRL", action = act.SplitPane({ direction = "Down" }) },

		-- RESIZE
		{ key = "h", mods = "CTRL|ALT", action = act.AdjustPaneSize({ "Left", 1 }) },
		{ key = "l", mods = "CTRL|ALT", action = act.AdjustPaneSize({ "Right", 1 }) },
		{ key = "k", mods = "CTRL|ALT", action = act.AdjustPaneSize({ "Up", 1 }) },
		{ key = "j", mods = "CTRL|ALT", action = act.AdjustPaneSize({ "Down", 1 }) },
	},
}

-- =============================================================

return config

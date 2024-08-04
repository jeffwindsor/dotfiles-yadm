local wezterm = require("wezterm")
local config = wezterm.config_builder()
local act = wezterm.action

-- =============================================================

config.color_scheme = "Tokyo Night Moon"
config.font = wezterm.font("JetBrainsMono Nerd Font Mono")
-- config.font = wezterm.font("Monaco")
config.font_size = 14.0
config.inactive_pane_hsb = {
	saturation = 0.9,
	brightness = 0.5,
}
config.window_background_opacity = 0.98
config.window_close_confirmation = "NeverPrompt"

-- =============================================================
-- Copy, Paste, Insert, Tab, Space, Enter
-- PageUp, PageDown, LeftArrow, RightArrow, UpArrow, DownArrow

config.keys = {
	-- NEW TAB
	{ key = "t", mods = "CTRL", action = act.SpawnTab("CurrentPaneDomain") },

	-- CLOSE PANE
	{ key = "x", mods = "CTRL", action = act.CloseCurrentPane({ confirm = false }) },

	-- ZOOM PANE
	{ key = "a", mods = "CTRL", action = act.TogglePaneZoomState },

	-- FOCUS PANE
	{ key = "h", mods = "CTRL", action = act.ActivatePaneDirection("Left") },
	{ key = "k", mods = "CTRL", action = act.ActivatePaneDirection("Up") },
	{ key = "l", mods = "CTRL", action = act.ActivatePaneDirection("Right") },
	{ key = "j", mods = "CTRL", action = act.ActivatePaneDirection("Down") },
	{ key = ";", mods = "CTRL", action = act.PaneSelect({ mode = "Activate" }) },

	-- ROTATE PANES
	{ key = "[", mods = "CTRL", action = act.RotatePanes("CounterClockwise") },
	{ key = "]", mods = "CTRL", action = act.RotatePanes("Clockwise") },
	{ key = "\\", mods = "CTRL", action = act.PaneSelect({ mode = "SwapWithActive" }) },

	--  SPLIT PANE
	{ key = "H", mods = "CTRL", action = act.SplitPane({ direction = "Left" }) },
	{ key = "K", mods = "CTRL", action = act.SplitPane({ direction = "Up" }) },
	{ key = "L", mods = "CTRL", action = act.SplitPane({ direction = "Right" }) },
	{ key = "J", mods = "CTRL", action = act.SplitPane({ direction = "Down" }) },

	--  RESIZE PANE
	{ key = "LeftArrow", mods = "CTRL", action = act.AdjustPaneSize({ "Left", 1 }) },
	{ key = "UpArrow", mods = "CTRL", action = act.AdjustPaneSize({ "Up", 1 }) },
	{ key = "RightArrow", mods = "CTRL", action = act.AdjustPaneSize({ "Right", 1 }) },
	{ key = "DownArrow", mods = "CTRL", action = act.AdjustPaneSize({ "Down", 1 }) },
}

return config

-- ---------------------------------------
-- DEFAULTS
-- { key = "P", mods = "CTRL", action = act.ActivateCommandPalette },
-- { key = '-', mods = 'CTRL', action = wezterm.action.DecreaseFontSize },
-- { key = "=", mods = "CTRL", action = wezterm.action.IncreaseFontSize },

-- ---------------------------------------
-- KEY TABLE EXAMPLE
-- {
-- 	key = "p",
-- 	mods = "CTRL|ALT|SHIFT",
-- 	action = act.ActivateKeyTable({
-- 		name = "pane_management",
-- 		one_shot = false,
-- 	}),
-- },

-- config.key_tables = {
-- 	-- PANE MANAGEMENT MODE KEY MAP
-- 	pane_management = {
--
-- 		{ key = "Escape", action = "PopKeyTable" }, -- CANCEL MODE
-- 		{ key = "q", action = act.CloseCurrentPane({ confirm = false }) }, -- CLOSE
-- 		{ key = "x", action = act.CloseCurrentPane({ confirm = false }) }, -- CLOSE
--
-- 		-- ACTIVATE
-- 		{ key = "h", mods = "CTRL", action = act.ActivatePaneDirection("Left") },
-- 		{ key = "l", mods = "CTRL", action = act.ActivatePaneDirection("Right") },
-- 		{ key = "k", mods = "CTRL", action = act.ActivatePaneDirection("Up") },
-- 		{ key = "j", mods = "CTRL", action = act.ActivatePaneDirection("Down") },
--
-- 		-- SPLIT
-- 		{ key = "h", mods = "CTRL|ALT", action = act.SplitPane({ direction = "Left" }) },
-- 		{ key = "k", mods = "CTRL|ALT", action = act.SplitPane({ direction = "Up" }) },
-- 		{ key = "l", mods = "CTRL|ALT", action = act.SplitPane({ direction = "Right" }) },
-- 		{ key = "j", mods = "CTRL|ALT", action = act.SplitPane({ direction = "Down" }) },
--
-- 		-- RESIZE
-- 		{ key = "h", mods = "CTRL|ALT|SUPER", action = act.AdjustPaneSize({ "Left", 1 }) },
-- 		{ key = "l", mods = "CTRL|ALT|SUPER", action = act.AdjustPaneSize({ "Right", 1 }) },
-- 		{ key = "k", mods = "CTRL|ALT|SUPER", action = act.AdjustPaneSize({ "Up", 1 }) },
-- 		{ key = "j", mods = "CTRL|ALT|SUPER", action = act.AdjustPaneSize({ "Down", 1 }) },
-- 	},
-- }

-- =============================================================

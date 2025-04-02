local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.font = wezterm.font("JetBrains Mono")

config.font_size = 13

config.window_close_confirmation = "NeverPrompt"
config.hide_tab_bar_if_only_one_tab = true

config.color_scheme_dirs = { "./colors/" }
config.color_scheme = "melange_dark"

config.default_prog = { "nu" }

config.keys = {
	{
		key = "Enter",
		mods = "ALT",
		action = wezterm.action.DisableDefaultAssignment,
	},
}

return config

local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.font = wezterm.font("JetBrains Mono")

config.font_size = 15

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

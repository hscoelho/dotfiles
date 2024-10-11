local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.font = wezterm.font("JetBrainsMono Nerd Font")

config.font_size = 15

config.color_scheme_dirs = { "./colors/" }
config.color_scheme = "melange_dark"

-- TODO: mudar dependendo do os
config.default_prog = { "C:/Program Files/nu/bin/nu.exe" }

config.keys = {
	{
		key = "Enter",
		mods = "ALT",
		action = wezterm.action.DisableDefaultAssignment,
	},
}

return config

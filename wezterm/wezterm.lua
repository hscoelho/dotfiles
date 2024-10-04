local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.font = wezterm.font("JetBrainsMono Nerd Font")

config.font_size = 16
config.color_scheme = "Gruvbox dark, hard (base16)"

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

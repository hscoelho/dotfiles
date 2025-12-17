local wezterm = require("wezterm")
local config = wezterm.config_builder()

if wezterm.target_triple == "x86_64-pc-windows-msvc" then
	config.default_prog = { "nu" }
end

config.font = wezterm.font_with_fallback({ "Maple Mono NF CN", "GoMono Nerd Font" })

config.font_size = 12

config.window_close_confirmation = "NeverPrompt"
config.hide_tab_bar_if_only_one_tab = true

-- config.color_scheme_dirs = { "./colors/" }
-- config.color_scheme = "everforest"
-- config.color_scheme = "monokai_pro_machine"
config.color = require("cyberdream")

config.keys = {
	{
		key = "Enter",
		mods = "ALT",
		action = wezterm.action.DisableDefaultAssignment,
	},
}

config.enable_scroll_bar = true
config.window_padding = {
	left = 10,
	right = 5,
	top = 5,
	bottom = 5,
}

local opacity = 0.9
config.window_background_opacity = opacity

return config

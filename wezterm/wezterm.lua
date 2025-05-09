local wezterm = require("wezterm")
local config = wezterm.config_builder()

if wezterm.target_triple == "x86_64-pc-windows-msvc" then
	config.default_prog = { "nu" }
else
	config.default_prog = { "fish" }
	local toggle_terminal = wezterm.plugin.require("https://github.com/zsh-sage/toggle_terminal.wez")
	-- toggle_terminal.apply_to_config(config)
end

config.font = wezterm.font("JetBrains Mono")

config.font_size = 12

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

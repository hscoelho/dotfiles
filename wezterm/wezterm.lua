local wezterm = require("wezterm")
local config = wezterm.config_builder()

if wezterm.target_triple == "x86_64-pc-windows-msvc" then
	config.default_prog = { "nu" }
else
	config.default_prog = { "fish" }
end

config.font =
	wezterm.font_with_fallback({ { family = "Intel One Mono", harfbuzz_features = { "ss01" } }, "JetBrains Mono" })

config.font_size = 12

config.window_close_confirmation = "NeverPrompt"
config.hide_tab_bar_if_only_one_tab = true

config.color_scheme_dirs = { "./colors/" }
config.color_scheme = "alabaster_dark"

config.keys = {
	{
		key = "Enter",
		mods = "ALT",
		action = wezterm.action.DisableDefaultAssignment,
	},
}

config.enable_scroll_bar = true

return config

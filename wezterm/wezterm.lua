local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.font = wezterm.font("JetBrainsMono Nerd Font")

config.font_size = 16
config.color_scheme = "Gruvbox dark, hard (base16)"

config.default_prog = { "C:/Program Files/nu/bin/nu.exe" }

return config

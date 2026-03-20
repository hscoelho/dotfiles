def main [] {
  let root = ($env.CURRENT_FILE | path dirname)
  let palette = open ($root | path join "book-theme.json")

  wezterm_theme $palette | save -f ($root | path join "wezterm/book.lua")
  nvim_palette $palette | save -f ($root | path join "nvim/lua/book-theme-palette.lua")
  rio_theme $palette | save -f ($root | path join "rio/themes/book.toml")
  kitty_theme $palette | save -f ($root | path join "kitty/theme.conf")

  print "Theme files updated."
}

def wezterm_theme [palette] {
$"-- book theme for wezterm — light/paper palette

return {
	foreground = '($palette.fg)',
	background = '($palette.bg)',

	cursor_bg = '($palette.red)',
	cursor_fg = '($palette.bg)',
	cursor_border = '($palette.red)',

	selection_fg = '($palette.fg)',
	selection_bg = '($palette.bg_select)',

	scrollbar_thumb = '($palette.fg_muted)',
	split = '($palette.fg_muted)',

	ansi = { '($palette.fg)', '($palette.red)', '($palette.green)', '($palette.yellow_light)', '($palette.blue)', '($palette.magenta)', '($palette.cyan)', '($palette.fg_muted)' },
	brights = { '($palette.fg_soft)', '($palette.red_light)', '($palette.green)', '($palette.yellow_light)', '($palette.blue)', '($palette.magenta_light)', '($palette.cyan)', '($palette.bg_dim)' },
}
"
}

def nvim_palette [palette] {
$"return {
  bg = '($palette.bg)',
  bg_alt = '($palette.bg_alt)',
  bg_dim = '($palette.bg_dim)',
  bg_select = '($palette.bg_select)',
  fg = '($palette.fg)',
  fg_muted = '($palette.fg_muted)',
  fg_soft = '($palette.fg_soft)',
  burgundy = '($palette.red)',
  forest = '($palette.green)',
  navy = '($palette.blue)',
  gold = '($palette.yellow_light)',
  plum = '($palette.magenta)',
  clay = '($palette.red_light)',
  sage = '($palette.cyan)',
  rose = '($palette.magenta_light)',
  brown = '($palette.yellow)',
}
"
}

def kitty_theme [palette] {
$"foreground ($palette.fg)
background ($palette.bg)

color0 ($palette.fg)
color8 ($palette.fg_soft)
color1 ($palette.red)
color9 ($palette.magenta_light)
color2  ($palette.green)
color10 ($palette.green)
color3  ($palette.yellow_light)
color11 ($palette.yellow_light)
color4  ($palette.blue)
color12 ($palette.blue)
color5  ($palette.magenta)
color13 ($palette.magenta_light)
color6  ($palette.cyan)
color14 ($palette.cyan)
color7  ($palette.bg_dim)
color15 ($palette.bg)
mark1_background ($palette.bg_select)
mark2_foreground ($palette.fg)
mark2_background ($palette.bg_alt)
mark3_foreground ($palette.fg)
mark3_background ($palette.magenta)
selection_foreground ($palette.fg)
selection_background ($palette.bg_select)
cursor ($palette.fg_soft)
cursor_text_color ($palette.bg)
inactive_border_color ($palette.bg_dim)
bell_border_color ($palette.red)
active_tab_foreground   ($palette.fg)
active_tab_background   ($palette.bg_dim)
inactive_tab_foreground ($palette.fg_muted)
inactive_tab_background ($palette.bg_alt)
"
}

def rio_theme [palette] {
$"# book theme — light/paper palette

[colors]
background = '($palette.bg)'
foreground = '($palette.fg)'

# Selection
selection-background = '($palette.bg_select)'
selection-foreground = '($palette.fg)'

# Navigation
tabs-active = '($palette.bg_dim)'
tabs-active-foreground = '($palette.fg)'
tabs-active-highlight = '($palette.red)'
bar = '($palette.bg_alt)'
split = '($palette.fg_muted)'
cursor = '($palette.red)'
vi-cursor = '($palette.blue)'

# Search
search-match-background = '($palette.yellow_light)'
search-match-foreground = '($palette.bg)'
search-focused-match-background = '($palette.red)'
search-focused-match-foreground = '($palette.bg)'

# Regular colors
black = '($palette.fg)'
blue = '($palette.blue)'
cyan = '($palette.cyan)'
green = '($palette.green)'
magenta = '($palette.magenta)'
red = '($palette.red)'
tabs = '($palette.bg_alt)'
white = '($palette.fg_muted)'
yellow = '($palette.yellow_light)'

# Dim colors
dim-black = '($palette.fg_soft)'
dim-blue = '($palette.blue)'
dim-cyan = '($palette.cyan)'
dim-foreground = '($palette.fg_muted)'
dim-green = '($palette.green)'
dim-magenta = '($palette.magenta)'
dim-red = '($palette.red_light)'
dim-white = '($palette.bg_dim)'
dim-yellow = '($palette.yellow_light)'

# Light colors
light-black = '($palette.fg_soft)'
light-blue = '($palette.blue)'
light-cyan = '($palette.cyan)'
light-foreground = '($palette.fg_soft)'
light-green = '($palette.green)'
light-magenta = '($palette.magenta_light)'
light-red = '($palette.red_light)'
light-white = '($palette.bg_dim)'
light-yellow = '($palette.yellow_light)'
"
}

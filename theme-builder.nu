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

	cursor_bg = '($palette.burgundy)',
	cursor_fg = '($palette.bg)',
	cursor_border = '($palette.burgundy)',

	selection_fg = '($palette.fg)',
	selection_bg = '($palette.bg_select)',

	scrollbar_thumb = '($palette.fg_muted)',
	split = '($palette.fg_muted)',

	ansi = { '($palette.fg)', '($palette.burgundy)', '($palette.forest)', '($palette.gold)', '($palette.navy)', '($palette.plum)', '($palette.sage)', '($palette.fg_muted)' },
	brights = { '($palette.fg_soft)', '($palette.clay)', '($palette.forest)', '($palette.gold)', '($palette.navy)', '($palette.rose)', '($palette.sage)', '($palette.bg_dim)' },
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
  burgundy = '($palette.burgundy)',
  forest = '($palette.forest)',
  navy = '($palette.navy)',
  gold = '($palette.gold)',
  plum = '($palette.plum)',
  clay = '($palette.clay)',
  sage = '($palette.sage)',
  rose = '($palette.rose)',
  brown = '($palette.brown)',
}
"
}

def kitty_theme [palette] {
$"foreground ($palette.fg)
background ($palette.bg)

color0 ($palette.fg)
color8 ($palette.fg_soft)
color1 ($palette.burgundy)
color9 ($palette.rose)
color2  ($palette.forest)
color10 ($palette.forest)
color3  ($palette.gold)
color11 ($palette.gold)
color4  ($palette.navy)
color12 ($palette.navy)
color5  ($palette.plum)
color13 ($palette.rose)
color6  ($palette.sage)
color14 ($palette.sage)
color7  ($palette.bg_dim)
color15 ($palette.bg)
mark1_background ($palette.bg_select)
mark2_foreground ($palette.fg)
mark2_background ($palette.bg_alt)
mark3_foreground ($palette.fg)
mark3_background ($palette.plum)
selection_foreground ($palette.fg)
selection_background ($palette.bg_select)
cursor ($palette.fg_soft)
cursor_text_color ($palette.bg)
inactive_border_color ($palette.bg_dim)
bell_border_color ($palette.burgundy)
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
tabs-active-highlight = '($palette.burgundy)'
bar = '($palette.bg_alt)'
split = '($palette.fg_muted)'
cursor = '($palette.burgundy)'
vi-cursor = '($palette.navy)'

# Search
search-match-background = '($palette.gold)'
search-match-foreground = '($palette.bg)'
search-focused-match-background = '($palette.burgundy)'
search-focused-match-foreground = '($palette.bg)'

# Regular colors
black = '($palette.fg)'
blue = '($palette.navy)'
cyan = '($palette.sage)'
green = '($palette.forest)'
magenta = '($palette.plum)'
red = '($palette.burgundy)'
tabs = '($palette.bg_alt)'
white = '($palette.fg_muted)'
yellow = '($palette.gold)'

# Dim colors
dim-black = '($palette.fg_soft)'
dim-blue = '($palette.navy)'
dim-cyan = '($palette.sage)'
dim-foreground = '($palette.fg_muted)'
dim-green = '($palette.forest)'
dim-magenta = '($palette.plum)'
dim-red = '($palette.clay)'
dim-white = '($palette.bg_dim)'
dim-yellow = '($palette.gold)'

# Light colors
light-black = '($palette.fg_soft)'
light-blue = '($palette.navy)'
light-cyan = '($palette.sage)'
light-foreground = '($palette.fg_soft)'
light-green = '($palette.forest)'
light-magenta = '($palette.rose)'
light-red = '($palette.clay)'
light-white = '($palette.bg_dim)'
light-yellow = '($palette.gold)'
"
}

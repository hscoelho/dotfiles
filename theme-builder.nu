def main [] {
  let root = ($env.CURRENT_FILE | path dirname)
  let palette = open ($root | path join "book-theme.json")

  wezterm_theme $palette | save -f ($root | path join "wezterm/book.lua")
  nvim_palette $palette | save -f ($root | path join "nvim/lua/book-theme-palette.lua")
  rio_theme $palette | save -f ($root | path join "rio/themes/book.toml")

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

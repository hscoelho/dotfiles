def main [] {
  let root = ($env.CURRENT_FILE | path dirname)
  let palette = open ($root | path join "book-theme.json")

  wezterm_theme $palette | save -f ($root | path join "wezterm/book.lua")
  nvim_palette $palette | save -f ($root | path join "nvim/lua/book-theme-palette.lua")
  ghostty_theme $palette | save -f ($root | path join "ghostty/themes/book")

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

def ghostty_theme [palette] {
$"# book theme — light/paper palette
palette = 0=($palette.fg)
palette = 1=($palette.burgundy)
palette = 2=($palette.forest)
palette = 3=($palette.gold)
palette = 4=($palette.navy)
palette = 5=($palette.plum)
palette = 6=($palette.sage)
palette = 7=($palette.fg_muted)
palette = 8=($palette.fg_soft)
palette = 9=($palette.clay)
palette = 10=($palette.forest)
palette = 11=($palette.gold)
palette = 12=($palette.navy)
palette = 13=($palette.rose)
palette = 14=($palette.sage)
palette = 15=($palette.bg_dim)

background = ($palette.bg)
foreground = ($palette.fg)
cursor-color = ($palette.burgundy)
selection-background = ($palette.bg_select)
selection-foreground = ($palette.fg)
"
}

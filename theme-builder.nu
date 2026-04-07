def main [] {
  let root = ($env.CURRENT_FILE | path dirname)
  let palette = open ($root | path join "book-theme.json")

  wezterm_theme $palette | save -f ($root | path join "wezterm/book.lua")
  nvim_palette $palette | save -f ($root | path join "nvim/lua/book-theme-palette.lua")
  kitty_theme $palette | save -f ($root | path join "kitty/theme.conf")
  zellij_theme $palette | save -f ($root | path join "zellij/themes/book.kdl")
  obsidian_minimal_settings_theme $palette | save -f ($root | path join "misc/obsidian-minimal-book-colors.json")

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
	brights = { '($palette.fg_soft)', '($palette.red_light)', '($palette.green_light)', '($palette.yellow_light)', '($palette.blue_light)', '($palette.magenta_light)', '($palette.cyan_light)', '($palette.bg_dim)' },
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
  red = '($palette.red)',
  green = '($palette.green)',
  blue = '($palette.blue)',
  yellow_light = '($palette.yellow_light)',
  magenta = '($palette.magenta)',
  red_light = '($palette.red_light)',
  cyan = '($palette.cyan)',
  magenta_light = '($palette.magenta_light)',
  yellow = '($palette.yellow)',
}
"
}

def convert_palette_hex_to_number [palette] {
  $palette | transpose key val | update val {|row| hex_to_number $row.val } | transpose --ignore-titles -d -r
}

def hex_to_number [hex] {
  let r = $hex | str substring 1..2 | decode hex | to text | str substring 1..-2
  let g = $hex | str substring 3..4 | decode hex | to text | str substring 1..-2
  let b = $hex | str substring 5..6 | decode hex | to text | str substring 1..-2
  $"($r) ($g) ($b)"
}

def zellij_theme [palette] {
  let p = convert_palette_hex_to_number $palette
$"themes {
    book {
        text_unselected {
            base ($p.bg)
            background ($p.fg)
            emphasis_0 ($p.blue_light)
            emphasis_1 ($p.cyan_light)
            emphasis_2 ($p.green_light)
            emphasis_3 ($p.magenta_light)
        }
        text_selected {
            base ($p.fg)
            background ($p.bg_select)
            emphasis_0 ($p.blue_light)
            emphasis_1 ($p.cyan_light)
            emphasis_2 ($p.green_light)
            emphasis_3 ($p.magenta_light)
        }
        ribbon_selected {
            base ($p.bg)
            background ($p.red)
            emphasis_0 ($p.blue)
            emphasis_1 ($p.blue_light)
            emphasis_2 ($p.magenta_light)
            emphasis_3 ($p.fg_muted)
        }
        ribbon_unselected {
            base ($p.fg)
            background ($p.bg_alt)
            emphasis_0 ($p.blue)
            emphasis_1 ($p.bg_select)
            emphasis_2 ($p.fg_muted)
            emphasis_3 ($p.magenta_light)
        }
        table_title {
            base ($p.red)
            background ($p.bg_alt)
            emphasis_0 ($p.blue_light)
            emphasis_1 ($p.cyan_light)
            emphasis_2 ($p.green_light)
            emphasis_3 ($p.magenta_light)
        }
        table_cell_selected {
            base ($p.fg)
            background ($p.bg_select)
            emphasis_0 ($p.blue_light)
            emphasis_1 ($p.cyan_light)
            emphasis_2 ($p.green_light)
            emphasis_3 ($p.magenta_light)
        }
        table_cell_unselected {
            base ($p.fg)
            background ($p.bg)
            emphasis_0 ($p.blue_light)
            emphasis_1 ($p.cyan_light)
            emphasis_2 ($p.green_light)
            emphasis_3 ($p.magenta_light)
        }
        list_selected {
            base ($p.fg)
            background ($p.bg_select)
            emphasis_0 ($p.blue_light)
            emphasis_1 ($p.cyan_light)
            emphasis_2 ($p.green_light)
            emphasis_3 ($p.magenta_light)
        }
        list_unselected {
            base ($p.fg)
            background ($p.bg)
            emphasis_0 ($p.blue_light)
            emphasis_1 ($p.cyan_light)
            emphasis_2 ($p.green_light)
            emphasis_3 ($p.magenta_light)
        }
        frame_selected {
            base ($p.red)
            background ($p.bg_select)
            emphasis_0 ($p.blue_light)
            emphasis_1 ($p.cyan_light)
            emphasis_2 ($p.magenta_light)
            emphasis_3 0
        }
        frame_highlight {
            base ($p.blue_light)
            background 0
            emphasis_0 ($p.magenta_light)
            emphasis_1 ($p.blue_light)
            emphasis_2 ($p.blue_light)
            emphasis_3 ($p.blue_light)
        }
        exit_code_success {
            base ($p.green)
            background 0
            emphasis_0 ($p.cyan_light)
            emphasis_1 ($p.red)
            emphasis_2 ($p.magenta_light)
            emphasis_3 ($p.fg_muted)
        }
        exit_code_error {
            base ($p.red)
            background 0
            emphasis_0 ($p.yellow)
            emphasis_1 0
            emphasis_2 0
            emphasis_3 0
        }
        multiplayer_user_colors {
            player_1 ($p.magenta_light)
            player_2 ($p.red)
            player_3 ($p.blue)
            player_4 ($p.yellow_light)
            player_5 ($p.cyan_light)
            player_6 0
            player_7 0
            player_8 0
            player_9 0
            player_10 0
        }
    }
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
color10 ($palette.green_light)
color3  ($palette.yellow_light)
color11 ($palette.yellow_light)
color4  ($palette.blue)
color12 ($palette.blue_light)
color5  ($palette.magenta)
color13 ($palette.magenta_light)
color6  ($palette.cyan)
color14 ($palette.cyan_light)
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

def obsidian_minimal_settings_theme [palette] {
$"{
  "minimal-style@@base@@light": "($palette.bg_alt)",
  "minimal-style@@bg1@@light": "($palette.bg)",
  "minimal-style@@bg2@@light": "($palette.bg_alt)",
  "minimal-style@@bg3@@light": "($palette.red_light)",
  "minimal-style@@ui1@@light": "($palette.bg_dim)",
  "minimal-style@@ui2@@light": "($palette.bg_select)",
  "minimal-style@@ui3@@light": "($palette.bg_alt)",
  "minimal-style@@ax1@@light": "($palette.blue)",
  "minimal-style@@ax2@@light": "($palette.blue_light)",
  "minimal-style@@ax3@@light": "($palette.red_light)",
  "minimal-style@@sp1@@light": "($palette.fg)",
  "minimal-style@@color-red@@light": "($palette.red)",
  "minimal-style@@color-orange@@light": "($palette.red_light)",
  "minimal-style@@color-yellow@@light": "($palette.yellow)",
  "minimal-style@@color-green@@light": "($palette.green)",
  "minimal-style@@color-cyan@@light": "($palette.cyan)",
  "minimal-style@@color-blue@@light": "($palette.blue)",
  "minimal-style@@color-purple@@light": "($palette.magenta)",
  "minimal-style@@color-pink@@light": "($palette.magenta_light)"
}
"
}

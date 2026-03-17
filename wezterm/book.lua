-- book theme for wezterm — light/paper palette

-- HEX,Material / Brand,Grade / Type,CIELAB (L* a* b*),Pantone Reference
-- #F9F4E5,Arctic Paper,Munken Pure,"96, 0, 5",9161 C
-- #F2EBDC,Holmen Paper,BOOK Extra Cream,80 (Brightness),7500 C
-- #F5F0DF,Trade Standard,50# Cream Offset,"88, 1, 6",155 C
-- #E0D3AF,Antique Stock,Aged Lignin (30yr+),"88, 6, 22",7500 C
-- #FBF0D9,Kindle Theme,Sepia,N/A,Tan / Pale Gold
-- local bg = "#F9F4E5"
-- local bg = "#F2EBDC"
-- local bg = "#F5F0DF"
-- local bg = "#E0D3AF"
local bg = "#FBF0D9"

return {
	foreground = "#262626",
	background = bg,

	cursor_bg = "#8B1A1A",
	cursor_fg = bg,
	cursor_border = "#8B1A1A",

	selection_fg = "#262626",
	selection_bg = "#D7CDB6",

	scrollbar_thumb = "#928374",
	split = "#928374",

	ansi = { "#262626", "#8B1A1A", "#4B7A47", "#996D00", "#2D5B8E", "#7A4A80", "#2A7B7B", "#928374" },
	brights = { "#504945", "#8F3F2D", "#4B7A47", "#996D00", "#2D5B8E", "#A0416A", "#2A7B7B", "#E6DBC5" },
}

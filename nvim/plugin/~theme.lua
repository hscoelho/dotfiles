-- other themes I might add: sonokai

require('cyberdream').setup {
  transparent = true,
  overrides = function(colors)
    return {
      -- Comment = { fg = colors.red, bg = 'NONE', italic = true },
    }
  end,
}

require('kanagawa').setup {
  transparent = true,
}

require('gruvbox').setup {
  transparent_mode = true,
  overrides = {
    -- Comment = { fg = '#504945' },
    Comment = { fg = '#427b58' },
  },
}

require 'theme_setter'

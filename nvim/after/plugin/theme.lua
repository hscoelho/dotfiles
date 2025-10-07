require('kanagawa').setup {
  transparent = true,
}

local leaf_colors = require('leaf.colors').setup()
require('leaf').setup {
  transparent = true,
  overrides = {
    Comment = { fg = leaf_colors.leaf_red_0 },
  },
}

require('nightfox').setup {
  options = {
    transparent = true,
  },
}

require('catppuccin').setup {
  transparent_background = true,
  float = {
    transparent = true,
    solid = false, -- use solid styling for floating windows, see |winborder|
  },
  custom_highlights = function(colors)
    return {
      Comment = { fg = colors.teal },
    }
  end,
}

vim.cmd.colorscheme 'catppuccin'

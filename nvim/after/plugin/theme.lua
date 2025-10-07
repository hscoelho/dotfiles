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

vim.cmd.colorscheme 'leaf'

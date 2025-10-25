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

require('everforest').setup {
  ui_contrast = 'high',
  background = 'hard',
  transparent_background_level = 2,
  on_highlights = function(hl, palette)
    hl.Comment = { fg = palette.orange, bg = palette.none }
  end,
}

require('monokai-pro').setup {
  transparent_background = true,
  styles = {
    comment = { italic = false },
    keyword = { italic = false }, -- any other keyword
    type = { italic = false }, -- (preferred) int, long, char, etc
    storageclass = { italic = false }, -- static, register, volatile, etc
    structure = { italic = false }, -- struct, union, enum, etc
    parameter = { italic = false }, -- parameter pass in function
    annotation = { italic = false },
    tag_attribute = { italic = false }, -- attribute of tag in reactjs
  },
  background_clear = {
    'float_win',
    -- 'toggleterm',
    -- 'telescope',
    -- 'which-key',
    -- 'renamer',
    -- 'notify',
    -- 'nvim-tree',
    -- 'neo-tree',
    -- 'bufferline', -- better used if background of `neo-tree` or `nvim-tree` is cleared
  },
  override = function(c)
    return {
      Comment = { fg = c.base.dimmed1 },
    }
  end,
}

vim.cmd.colorscheme 'monokai-pro-machine'

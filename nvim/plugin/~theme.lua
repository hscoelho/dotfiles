require('cyberdream').setup {
  transparent = true,
  overrides = function(colors)
    return {
      Comment = { fg = colors.yellow, bg = 'NONE', italic = true },
    }
  end,
}
require('kanagawa').setup {
  transparent = true,
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

require('monokai-pro').setup {
  transparent_background = true,
  styles = {
    -- this is not working
    annotation = { italic = false },
    comment = { italic = false },
    keyword = { italic = false }, -- any other keyword
    parameter = { italic = false }, -- parameter pass in function
    storageclass = { italic = false }, -- static, register, volatile, etc
    structure = { italic = false }, -- struct, union, enum, etc
    tag_attribute = { italic = false }, -- attribute of tag in reactjs
    type = { italic = false }, -- (preferred) int, long, char, etc
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

vim.cmd.colorscheme 'cyberdream'
-- The following code came from the referenced issue
-- Disable all italics (it's broken, waiting on https://github.com/loctvl842/monokai-pro.nvim/issues/136)
-- local disable_italics = function()
--   for _, group in ipairs(vim.fn.getcompletion('', 'highlight')) do
--     local ok, hl = pcall(vim.api.nvim_get_hl, 0, { name = group, link = false })
--     if ok and hl and hl.italic then
--       hl.italic = false
--       vim.api.nvim_set_hl(0, group, hl)
--     end
--   end
-- end
-- disable_italics()

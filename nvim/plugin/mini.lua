if vim.g.vscode then
  return
end

-- Better Around/Inside textobjects
--
-- Examples:
--  - va)  - [V]isually select [A]round [)]paren
--  - yinq - [Y]ank [I]nside [N]ext [Q]uote
--  - ci'  - [C]hange [I]nside [']quote
require('mini.ai').setup { n_lines = 500 }

-- Add/delete/replace surroundings (brackets, quotes, etc.)
require('mini.surround').setup {
  mappings = {
    add = 'gza', -- Add surrounding in Normal and Visual modes
    delete = 'gzd', -- Delete surrounding
    find = 'gzf', -- Find surrounding (to the right)
    find_left = 'gzF', -- Find surrounding (to the left)
    highlight = 'gzh', -- Highlight surrounding
    replace = 'gzr', -- Replace surrounding
  },
}

require('mini.files').setup {
  mappings = {
    go_in = 'L',
    go_in_plus = 'l',
  },
}

require('mini.icons').setup()
require('mini.extra').setup()
require('mini.hipatterns').setup {
  highlighters = {
    -- Highlight hex color strings (`#rrggbb`) using that color
    hex_color = require('mini.hipatterns').gen_highlighter.hex_color(),
  },
}

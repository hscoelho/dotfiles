if vim.g.vscode then
  return
end

local highlight = {
  'RainbowRed',
  'RainbowYellow',
  'RainbowBlue',
  'RainbowOrange',
  'RainbowGreen',
  'RainbowViolet',
  'RainbowCyan',
}

local hooks = require 'ibl.hooks'
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
  vim.api.nvim_set_hl(0, 'RainbowRed', { fg = '#ff6d7e' })
  vim.api.nvim_set_hl(0, 'RainbowYellow', { fg = '#ffed72' })
  vim.api.nvim_set_hl(0, 'RainbowBlue', { fg = '#7cd5f1' })
  vim.api.nvim_set_hl(0, 'RainbowOrange', { fg = '#ffb270' })
  vim.api.nvim_set_hl(0, 'RainbowGreen', { fg = '#a2e57b' })
  vim.api.nvim_set_hl(0, 'RainbowViolet', { fg = '#baa0f8' })
  vim.api.nvim_set_hl(0, 'RainbowCyan', { fg = '#56B6C2' })
end)

require('ibl').setup { indent = { highlight = highlight } }

require('guess-indent').setup {}
require('nvim-autopairs').setup()
require('todo-comments').setup(
  -- { signs = false }
)

require('which-key').setup {
  -- delay between pressing a key and opening which-key (milliseconds)
  -- this setting is independent of vim.o.timeoutlen
  delay = 0,
  icons = {
    mappings = true,
    keys = {},
  },

  -- Document existing key chains
  spec = {
    { '<leader>f', group = '[F]ind' },
    { '<leader>t', group = '[T]oggle' },
    { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
  },
}

require('hunk').setup()

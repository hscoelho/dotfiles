return {
  'Bekaboo/dropbar.nvim',
  -- optional, but required for fuzzy finder support
  dependencies = { 'nvim-telescope/telescope-fzf-native.nvim' },
  opts = {
    sources = {
      lsp = {
        max_depth = 12,
      },
      treesitter = {
        max_depth = 12,
      },
    },
  },
  config = function(_, opts)
    local api = require 'dropbar.api'
    vim.keymap.set('n', '<Leader>;', api.pick, { desc = 'Pick symbols in winbar' })
    vim.keymap.set('n', '[;', api.goto_context_start, { desc = 'Go to start of current context' })
    vim.keymap.set('n', '];', api.select_next_context, { desc = 'Select next context' })
    require('dropbar').setup(opts)
  end,
}

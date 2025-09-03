-- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
return {
  {
    'ellisonleao/gruvbox.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    config = function()
      -- vim.o.background = 'dark'
      -- vim.cmd.colorscheme 'gruvbox'
    end,
  },
  {
    'rebelot/kanagawa.nvim',
    priority = 1000,
    opts = {
      transparent = true,
    },
    config = function(_, opts)
      require('kanagawa').setup(opts)
      vim.cmd.colorscheme 'kanagawa-wave'
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et

return {
  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        vtsls = {},
      },
    },
  },
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    opts = function(_, opts)
      opts.ensure_installed = util.list_insert_unique(opts.ensure_installed, { 'vtsls' })
    end,
  },
}

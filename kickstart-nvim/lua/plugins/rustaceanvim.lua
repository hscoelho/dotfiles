return {
  {
    'mrcjkb/rustaceanvim',
    version = '^6', -- Recommended
    lazy = false, -- This plugin is already lazy
  },
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    opts = function(_, opts)
      opts.ensure_installed = util.list_insert_unique(opts.ensure_installed, { 'rust-analyzer', 'codelldb' })
    end,
  },
}

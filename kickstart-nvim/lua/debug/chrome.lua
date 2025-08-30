return {
  {
    'mfussenegger/nvim-dap',
    opts = function()
      local dap = require 'dap'
      dap.adapters['chrome'] = {
        type = 'server',
        host = 'localhost',
        port = '${port}',
        executable = {
          command = 'js-debug-adapter',
          args = { '${port}' },
        },
      }
    end,
  },
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    opts = function(_, opts)
      opts.ensure_installed = util.list_insert_unique(opts.ensure_installed, { 'js-debug-adapter' })
    end,
  },
}

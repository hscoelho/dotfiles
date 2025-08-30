return {
  {
    'mfussenegger/nvim-dap',
    opts = function()
      local dap = require 'dap'
      dap.adapters['firefox'] = {
        type = 'executable',
        command = vim.fn.exepath 'firefox-debug-adapter',
      }
      dap.configurations['firefox'] = {
        name = 'Firefox: Debug',
        type = 'firefox',
        request = 'launch',
        reAttach = true,
        url = 'http://localhost:4200',
        webRoot = '${workspaceFolder}',
        firefoxExecutable = '/usr/bin/flatpak run org.mozilla.firefox',
      }
    end,
  },
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    opts = function(_, opts)
      opts.ensure_installed = util.list_insert_unique(opts.ensure_installed, { 'firefox-debug-adapter' })
    end,
  },
}
